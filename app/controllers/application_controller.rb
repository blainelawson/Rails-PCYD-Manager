class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?, :is_admin?

    helpers 

        def current_user
            logged_in? ? Member.find_by(id: session[:user_id]) : "Guest"
        end

        def logged_in?
            !!session[:user_id]
        end
    
end
