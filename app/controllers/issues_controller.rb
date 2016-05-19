class IssuesController < ApplicationController
  def index
  	@issues=Issue.all
  end

  def create
    @issue = Issue.new(issue_params)
    if @issue.save
      redirect_to(action: 'index' , controller: 'welcome')
    else
      render('new')
    end
    token = rand(36**8).to_s(36)
    @issue.update_attributes(ticket_no: token, user_id: current_user.id)
  end

  def show_user_submissions
  	@issues = current_user.issues
  end

  def edit
  end

 	private 
  def issue_params
    params.require(:issues).permit(:heading, :description, :user_id)
  end
end