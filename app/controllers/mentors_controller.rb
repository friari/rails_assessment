class MentorsController < ApplicationController
    

    def index

    end

    def create
        @mentor = current_user.mentor.build(mentor_params)
    end

    def new
        @mentor = current_user.mentor.build
    end

    def edit

    end

    def show

    end

    def update

    end

    def destroy

    end

    def book

    end

    def review

    end

    def reviews

    end

    def createreview

    end
end