class CommitteesController < ApplicationController
    def new
        @committee = Committee.new
        @members = Member.all

        @member = Member.find_by(id: params[:member_id]) if params[:member_id]
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
        if params[:member_id]
            member = Member.find_by(id: current_user.id)
            @committees = member.committees.where("chair_id = ?", current_user.id)
        else
            @committees = Committee.all
        end
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
