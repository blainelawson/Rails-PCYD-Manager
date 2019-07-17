class CommitteesController < ApplicationController
    def new
        @committee = Committee.new
        @members = Member.all
    end

    def create
        @committee = Committee.create(committee_params)
        include_chair_on_committee
        redirect_to committees_path
    end

    def update
        @committee = Committee.find_by(id: params[:id])
        @committee.update(committee_params)
        include_chair_on_committee
        redirect_to committees_path
    end
   
    def index
        @committees = Committee.all
    end

    def show
        @committee = Committee.find_by(id: params[:id])
    end

    def edit
        @committee = Committee.find_by(id: params[:id])
        @members = Member.all
    end

    def destroy
        Committee.find_by(id: params[:id]).delete
        redirect_to committees_path
    end

    
    private

        def include_chair_on_committee
            if @committee.chair && !@committee.members.include?(@committee.chair)
                @committee.members << @committee.chair
            end
        end

        def committee_params
            params.require(:committee).permit(:name, :chair_id, member_ids: [])
        end

end
