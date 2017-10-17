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
	  if @user.update(user_params.except(:password))
      if user_params[:password].present? && !user_params[:password].empty?
        @user.update(password: user_params[:password])
        sign_in @user, :bypass => true
        if current_user.admin?
	        redirect_to users_path, notice: " #{@user.email} profile was successfully updated."
        else
          redirect_to user_path, notice: " #{@user.email} profile was successfully updated."
        end
      else
         if current_user.admin?
          redirect_to users_path, notice: " #{@user.email} profile was successfully updated."
        else
          redirect_to user_path, notice: " #{@user.email} profile was successfully updated."
        end
      end
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
    params.require(:user).permit(:email, :home_address, :work_address, :password, :approved, :role)
  end

  def require_admin
    if current_user.admin?
      return
    else
      redirect_to root_path
    end
  end
end
