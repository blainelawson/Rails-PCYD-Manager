class SessionsController < ApplicationController
    def welcome
    end

    def new
        @member = Member.new
    end

    def create
        # binding.pry
        @member = Member.find_by(email: params[:member][:email])
        # binding.pry
        if @member
            binding.pry
            session[:user_id] = @member.id
            # binding.pry
            redirect_to @member
        else
            flash[:message] = "Could not log you in with that information"
            redirect_to '/login'
        end
    end
end
