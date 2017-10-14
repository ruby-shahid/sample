class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :require_admin]
  before_action :authenticate_user!
  before_action :require_admin, :only => [:index]
  
  def index
    @users = User.all
  end

  def show
  end


  def edit
  	@user = User.find(params[:id])
  end


  def update
	  if @user.update(user_params)
	    redirect_to users_path, notice: " #{@user.email} profile was successfully updated."
	  else
	    format.html {render action: 'edit'}
	  end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html {redirect_to users_url, notice: 'User was successfully destroyed.'}
      format.json {head :no_content}
    end
  end


  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :home_address, :work_address, :approved)
  end

  def require_admin
    if current_user.admin?
      return
    else
      redirect_to root_path
    end
  end
end
