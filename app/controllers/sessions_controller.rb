class SessionsController < ApplicationController
    def welcome
    end

    def new
        @member = Member.new
    end

    def create
        @member = Member.find_by(email: params[:member][:email])
        if @member
            session[:user_id] = @member.id
            redirect_to @member
        else
            flash[:message] = "Could not log you in with that information"
            redirect_to '/login'
        end
    end

    def destroy
        session.delete :user_id
        redirect_to root_path
    end
end
