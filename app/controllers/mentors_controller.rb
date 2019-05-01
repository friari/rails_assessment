class MentorsController < ApplicationController
    before_action :authenticate_user!

    def home

    end

    def index

    end

    def create
        @mentor = current_user.build_mentor(mentor_params)
    end

    def new
        @mentor = current_user.build_mentor
        @skills = Skill.all
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