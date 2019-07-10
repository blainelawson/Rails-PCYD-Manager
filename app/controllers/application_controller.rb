class ApplicationController < ActionController::Base

    helpers do

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
end
