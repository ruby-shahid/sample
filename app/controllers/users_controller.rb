# frozen_string_literal: true
class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]
  # before_action :check_if_admin, except: [:update, :profile_upload]
  # before_action :modify_params, :only => [:update]
  # layout 'admin'

  def index
    @users = User.all
  end

  def show
  end

  # def new
  #   @user = User.new
  # end

  def edit
  	@user = User.find(params[:id])
  end

  # def create
  #   @user = User.new(user_params)

  #   respond_to do |format|
  #     if @user.save
  #       format.html {redirect_to @user, notice: 'User was successfully created.'}
  #       format.json {render :show, status: :created, location: @user}
  #     else
  #       format.html {render :new}
  #       format.json {render json: @user.errors, status: :unprocessable_entity}
  #     end
  #   end
  # end

  def update
	  if @user.update(user_params)
	    redirect_to users_path, notice: " #{@user.email} profile was successfully updated."
	  else
	    format.html {render action: 'edit'}
	  end
  end

  # def finish_signup
  #   if request.patch? && params[:user] 
  #     if @user.update(user_params)
  #       sign_in(@user, :bypass => true)
  #       redirect_to @user, notice: 'Your profile was successfully updated.'
  #     else
  #       @show_errors = true
  #     end
  #   end
  # end

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

  # def check_if_admin
  #   if !current_user.is_admin
  #     redirect_to root_path
  #   end
  # end

  # def get_name(proper_name)
  #   proper_name.split.map(&:capitalize)
  # end
end