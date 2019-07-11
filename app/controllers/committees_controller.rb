class CommitteesController < ApplicationController
    def new
        @committee = Committee.new
        @members = Member.all
    end
   
    def index
        @committees = Committee.all
    end

    def show
    end

    def edit
        @committee = Committee.find_by(id: params[:id])
        @members = Member.all
    end
    

end
