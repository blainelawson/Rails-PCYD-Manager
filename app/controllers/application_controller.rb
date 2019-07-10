class ApplicationController < ActionController::Base
    protect_from_forgery with: :null_session
    helper_method :current_user, :logged_in?, :is_admin?

    helpers 

        def current_user
            logged_in? ? Member.find_by(id: session[:user_id]) : "Guest"
        end

        def is_admin?
            return true if logged_in? && current_user.admin 
        end

        def logged_in?
            !!session[:user_id]
        end
    
end
