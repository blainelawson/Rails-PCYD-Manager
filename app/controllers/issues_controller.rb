class IssuesController < ApplicationController
    def new
    end

    def create
    end

    def index
        if params[:all] && params[:all] == "true"
            session.delete :all
            @issues = Issue.all
        elsif params[:young] && params[:young] == "true"
            session.delete :young
            @issues = Member.young_issues
        elsif params[:old] && params[:old] == "true"
            session.delete :old
            @issues = Member.old_issues
        else            
            @issues = Issue.all
        end
    end

    def edit
    end

    private

    def issue_params

    end
end
