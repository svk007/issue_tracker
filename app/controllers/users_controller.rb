class UsersController < ApplicationController
  filter_access_to :all
	def index
		@users=User.all
	end

	def edit
		@user = User.find_by_id(params[:id])
	end

def update
	@user = User.find_by_id(params[:id])
    if @user.update_attributes(user_params)
      flash[:notice] = "Role assigned successfully" 
      redirect_to(action: 'index')
    else
      render('edit')
    end
  end

  private
  def user_params
    params.require(:user).permit(role_ids: [])
  end
end
