class DirectorsController < ApplicationController
    def new
        @director = Director.new
        @members = Member.all
    end

    def create
        @director = Director.create(director_params)

        if @director.id
            flash[:success] = []
            flash[:success] << "Director successfully created"
            redirect_to directors_path
        else
            create_flash_errors(@director)
            redirect_to new_director_path
        end
    end

    def index
        @directors = Director.all
    end

    def edit
        @director = Director.find_by(id: params[:id])
        @members = Member.all
    end

    def update
        @director = Director.find_by(id: params[:id])
        @director.update(director_params)
        redirect_to directors_path
    end

    def destroy
        Director.find_by(id: params[:id]).delete
        redirect_to directors_path
    end

    private

    def director_params
        params.require(:director).permit(:title, :email, :phone, :chair_id)
    end

end
