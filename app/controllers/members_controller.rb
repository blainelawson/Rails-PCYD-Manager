class MembersController < ApplicationController

    def new 
        @member = Member.new
        @issues = Issue.all
    end

    def create
        @member = Member.create(member_params)

        if @member
            @member.issue_ids = params[:member][:issue_ids] # refactor with accepts_nested_attributes_for :issue_ids???
            session[:user_id] = @member.id
            redirect_to "/members/#{@member.id}/issues/edit_rank"
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
        redirect_to "/members/#{params[:id]}/issues/edit_rank"
    end

    private

    def datify_dob
        if logged_in? && Member.exists?(current_user.id)
            params[:member][:dob] = current_user.dob
        else
            month = params[:member][:month].to_i
            day = params[:member][:day].to_i
            year = params[:member][:year].to_i
            params[:member][:dob] = Date.new(year, month, day)
        end
    end

    def member_params
        datify_dob
        params.require(:member).permit(:name, :phone, :email, :address, :dob, :password)
    end
end
