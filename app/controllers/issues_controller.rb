class IssuesController < ApplicationController
  filter_access_to :all
  def index
  	@issues=Issue.all
  end

  def show_user_submissions
    @issues = current_user.issues
  end

  def edit
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
    flash[:notice] = "Please note down your token number #{token}"
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
    if @issue.update_attributes(developer: @user.email, status: "Assigned")
      redirect_to(action: 'index')
    end
  end

  def my_issues
    @issues = Issue.where(developer: current_user.email)
  end

  def start_work
    @issue = Issue.find_by_id(params[:id])
    if @issue.update_attributes(status: "In Progress")
      flash[:notice] = "Updated Status successfully"
    end
    redirect_to controller: 'issues', action: 'index'
  end

  def finish_work
    issue = Issue.find(params[:id])
    issue.update_attributes(status: "Finished")
    redirect_to controller: 'issues', action: 'index'
  end

 	private 
  def issue_params
    params.require(:issues).permit(:heading, :description, :user_id, :status)
  end
end