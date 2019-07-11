class MembersController < ApplicationController

    def new 
        @member = Member.new
        @issues = Issue.all
    end

    def create
        @member = Member.create(member_params)
        binding.pry
        if @member
            @member.issue_ids = params[:member][:issue_ids]
            session[:user_id] = @member.id
            redirect_to member_path(@member)
        else
            redirect_to new_member_path
        end
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

    helpers

        def datify_dob
            month = params[:member][:month].to_i
            day = params[:member][:day].to_i
            year = params[:member][:year].to_i
            params[:member][:dob] = Date.new(year, month, day)
        end

    private

    def member_params
        datify_dob
        params.require(:member).permit(:name, :phone, :email, :address, :dob, :password)
    end
end
