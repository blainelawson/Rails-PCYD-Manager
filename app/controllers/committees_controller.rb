class CommitteesController < ApplicationController
    def new
        @committee = Committee.new
        @members = Member.all
    end

    def create
        @committee = Committee.create(committee_params)
        @committee.member_ids = params[:committee][:member_ids]
        @committee.chair_id = params[:committee][:chair]
        @committee.save
        redirect_to committees_path
    end

    def update
        # I stopped using Committee.update(comm_params) because it was dropping my AR associations
        @committee = Committee.find_by(id: params[:id])
        @committee.name = params[:committee][:name]
        @committee.member_ids = params[:committee][:member_ids]
        @committee.chair_id = params[:committee][:chair]
        @committee.save
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

        def committee_params
            params.require(:committee).permit(:name, :member_ids)
        end

end
