class MembersController < ApplicationController

    def new 
        @member = Member.new
        @issues = Issue.all
    end

    def create
        @member = Member.create(member_params)

        if @member
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
        @member = Member.find_by(id: params[:id])
    end

    def edit
        @member = Member.find_by(id: params[:id])
        @issues = Issue.all
        @new_issues = []
        3.times do
            @issue = @member.issues.build
            @new_issues << @issue
        end
    end
    
    def update
        @member = Member.find_by(id: params[:id])
        @member.update(member_params)


        if !@member.errors.messages.empty?
            flash[:message] = @member.errors.messages 
            redirect_to edit_member_path(@member)
        else
            redirect_to "/members/#{params[:id]}/issues/edit_rank"
        end
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
        params.require(:member).permit(:name, :phone, :email, :address, :dob, :password, issue_ids: [], issues_attributes: [:key_word] )
    end
end
