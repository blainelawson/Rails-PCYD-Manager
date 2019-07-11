class CommitteesController < ApplicationController
    def index
        @committees = Committee.all
    end

    def show
    end
end
