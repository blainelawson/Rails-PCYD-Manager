class MembersController < ApplicationController

    def new 
        @member = Member.new
        @issues = Issue.all
    end

    def index
        @members = Member.all
    end

    def show
        @member = current_user
    end

    def edit
        @member = current_user
        @issues = Issue.all
    end
    
    def update
        @member = current_user
        @member.update(member_params)
        @member.issue_ids = params[:member][:issue_ids]
        @member.save
        redirect_to @member
    end

    private

    def member_params
        params.require(:member).permit(:name, :phone, :email, :address, :password)
    end
end
