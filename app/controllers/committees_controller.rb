class CommitteesController < ApplicationController
    def new
        @committee = Committee.new
        @members = Member.all
    end

    def create
        @committee = Committee.create(committee_params)
        @committee.member_ids = params[:committee][:member_ids]
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
    
    private

        def committee_params
            params.require(:committee).permit(:name, :member_ids)
        end

end
