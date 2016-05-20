class IssuesController < ApplicationController
  filter_access_to :all
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

  def show_devs
    @devs=[]
    User.all.each do |user|
      if user.role_ids.include?(2)
        @devs << user
      end
    end
  end

  def assign_dev
    @user = User.find_by_id(params[:id2])
    @issue = Issue.find_by_id(params[:id])
    if @issue.update_attributes(developer: @user.email, status: "In Progress")
      redirect_to(action: 'index')
    end
  end

  def show_user_submissions
  	@issues = current_user.issues
  end

  def edit
  end

 	private 
  def issue_params
    params.require(:issues).permit(:heading, :description, :user_id, :status)
  end
end