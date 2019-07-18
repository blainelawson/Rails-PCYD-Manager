class SessionsController < ApplicationController
    def welcome
    end

    def new
        @member = Member.new
    end

    def omniauth
        @user = Member.from_omniauth(auth)
        @user.save
        session[:user_id] = @user.id
        redirect_to member_path(@user)
      end

    def create
        @member = Member.find_by(email: params[:member][:email])
        if @member
            session[:user_id] = @member.id
            redirect_to @member
        else
            flash[:error] = []
            flash[:error] << "Could not log you in with that information"
            redirect_to '/login'
        end
    end

    def destroy
        session.delete :user_id
        redirect_to root_path
    end

    private

    def auth
        request.env['omniauth.auth']
    end
end
