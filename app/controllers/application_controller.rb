class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  def after_sign_in_path_for(resource)
  	if current_user.admin?
  	  users_path 
  	elsif !current_user.admin? && current_user.approved?
      user_path(current_user.id)
    # elsif !current_user.approved?
    #   pages_welcome_path
    else
      super
  	end	
  end

end
