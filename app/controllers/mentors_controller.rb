class MentorsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_listing, only: [:show, :edit, :update, :destroy, :review, :reviews, :book, :createreview]
    before_action :authorize_user, only: [:edit, :update, :destroy]

    def home
        #hero image home page with search bar
    end

    def index
        #shows all mentor listings or shows with search params
        @mentors = Mentor.all
    end

    def create
        #request creates new mentor listing
        @mentor = current_user.create_mentor(mentor_params)
        if @mentor.errors.any?
            redirect_to(new_mentor_path)
        else
            @mentor.skill_ids = params[:mentor][:skill_ids]
            redirect_to(mentor_path(@mentor))
        end
    end

    def new
        #shows form to create new mentor listing
        @mentor = Mentor.new
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
        @mentor = Mentor.find(current_user.mentor.id).update(mentor_params)            

        if @mentor
            current_user.mentor.skill_ids = params[:mentor][:skill_ids]
            redirect_to(mentor_path(current_user.mentor.id))
        else
            redirect_to(edit_mentor_path(current_user.mentor.id))
        end
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
        @mentor = Mentor.find(id)
    end

    def mentor_params
        params.require(:mentor).permit(:rate, :skill_ids, :about_me)
    end

    def authorize_user
        if @mentor.user_id != current_user.id
            redirect_to listings_path
        end
    end
end