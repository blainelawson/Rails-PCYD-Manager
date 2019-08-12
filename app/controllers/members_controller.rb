class MembersController < ApplicationController
    before_action :authenticate, except: [:index, :new, :create]

    def new 
        @member = Member.new
        @issues = Issue.all
        @new_issues = []
        3.times do
            @issue = @member.issues.build
            @new_issues << @issue
        end
    end

    def create
        @member = Member.new(member_params)

        if @member && @member.save
            flash[:success] = ["Success! You've registered as #{@member.name}."]
            session[:user_id] = @member.id
            redirect_to "/members/#{@member.id}/issues/edit_rank" # I can probably refactor this
        else
            create_flash_errors(@member)
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
            create_flash_errors(@member)
            redirect_to edit_member_path(@member)
        else
            redirect_to "/members/#{params[:id]}/issues/edit_rank"
        end
    end

    private

    def datify_dob
        if logged_in? && Member.exists?(current_user.id)
            params[:member][:dob] = current_user.dob
        elsif !params[:member][:month].empty? && !params[:member][:day].empty? && !params[:member][:year].empty?
            month = params[:member][:month].to_i
            day = params[:member][:day].to_i
            year = params[:member][:year].to_i
            params[:member][:dob] = Date.new(year, month, day)
        end
    end

    def member_params
        params.require(:member).permit(:name, :phone, :email, :address, datify_dob, :password, issue_ids: [], issues_attributes: [:key_word] )
    end
end
