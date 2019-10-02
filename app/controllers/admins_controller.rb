class AdminsController < ApplicationController
    def most_active_members
        @members = Member.most_active_members
    end
end
