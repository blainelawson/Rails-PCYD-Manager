class SessionsController < ApplicationController
    def welcome
    end

    def new
        @member = Member.new
    end
end
