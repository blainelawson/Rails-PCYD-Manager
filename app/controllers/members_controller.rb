class MembersController < ApplicationController
    def index
        @members = Member.all
    end

    def show
        binding.pry
    end

    
end
