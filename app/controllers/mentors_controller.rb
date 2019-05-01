class MentorsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_listing, only: [:show, :edit, :update, :destroy, :review, :reviews, :book, :createreview]

    def home
        #hero image home page with search bar
    end

    def index
        #shows all mentor listings or shows with search params
        @mentors = Mentor.all
        @mentor_filter = Mentor.where(params)
    end

    def create
        #request creates new mentor listing
        @mentor = current_user.create_mentor(mentor_params)
    end

    def new
        #shows form to create new mentor listing
        @mentor = current_user.create_mentor
        @skills = Skill.all
    end

    def edit
        #shows form to edit listing
    end

    def show
        #shows listing
    end

    def update
        #request that updates listing
    end

    def destroy
        #request that deletes listing
    end

    def book
        #shows pre-stripe booking message
    end

    def review
        #shows review form
    end

    def reviews
        #shows reviews for specific mentor listing
    end

    def createreview
        #request that creates review for specific mentor listing
    end

    private

    def set_listing
        id = params[:id]
        @mentor = Mentor.find(:id)
    end
end