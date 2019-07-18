class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?

    helpers 

        def current_user
            logged_in? ? Member.find_by(id: session[:user_id]) : "Guest"
        end

        def logged_in?
            !!session[:user_id]
        end
    
        def create_flash_errors(object)
            flash[:error] = []

            object.errors.messages.each do |k, v|
                flash[:error] << k.to_s.capitalize + " " + v.join
            end
        end
end
