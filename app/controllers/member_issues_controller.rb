class MemberIssuesController < ApplicationController
    
    def edit_rank
        @member = Member.find(params[:member_id])
        @member_issues = @member.issues
    end

    def update_rank
        @member = Member.find(params[:member_id])
        if @member
            @member.update(ranking_params)
            redirect_to member_path(@member)
        else
            create_flash_errors(@member)
            render 'edit_rank'
        end
    end

    private

    def ranking_params
        params.require(:member).permit(:member_issues_attributes => [:ranking, :id])
    end
end