class Users::SessionsController < Devise::SessionsController

  protected
    def after_sign_in_path_for(resource)
      session[:return_to] || root_path
    end
end