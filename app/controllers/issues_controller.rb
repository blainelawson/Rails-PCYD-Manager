class IssuesController < ApplicationController
    def new
    end

    def create
    end

    def edit
    end

    def edit_rank
        @member = Member.find(params[:member_id])
        @member_issues = @member.issues
    end

    def update_rank
        binding.pry
        @member = Member.find(params[:member_id])
        # binding.pry
    end
end
