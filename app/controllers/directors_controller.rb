class DirectorsController < ApplicationController
    def new
        @director = Director.new
    end

    def create
        @director = Director.create(director_params)
        @director.chair = Member.find_by(id: params[:director][:chair])
        @director.save
    end

    def index
        @directors = Director.all
    end

end
