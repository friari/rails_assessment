class MentorsController < ApplicationController
    before_action :authenticate_user!, except: [:home, :index]
    before_action :set_listing, only: [:show, :edit, :update, :destroy, :review, :reviews, :book, :createreview]
    before_action :authorize_user, only: [:edit, :update, :destroy]

    def home
        #hero image home page with search bar
        @search = Mentor.ransack(params[:q])
        @mentor = Mentor.all
        @skills = Skill.all
        @cities = User.all.pluck(:city).uniq
    end

    def index
        #shows all mentor listings or shows with search params
        @search = Mentor.ransack(params[:q])
        @mentors = @search.result(distinct: true).includes(:user, :skills)
        @mentor = Mentor.new
        @skills = Skill.all
        @users = User.all
        @cities = User.all.pluck(:city).uniq
    end

    def search
        index
        render :index
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
        stripe_session = Stripe::Checkout::Session.create(
            payment_method_types: ['card'],
            line_items: [{
                name: @mentor.user.full_name,
                description: "PA Training with #{@mentor.user.full_name}",
                amount: @mentor.rate,
                currency: 'aud',
                quantity: 1,
            }],
            payment_intent_data: {
                metadata: {
                    mentor_id: @mentor.id,
                    user_id: current_user.id,
                }

            },
            success_url: "http://localhost:3000/payments/success/#{@mentor.id}",
            cancel_url: 'http://localhost:3000/cancel',
            )
            @stripe_session_id = stripe_session.id
    end

    def review
        #shows review form
        @review = Review.new
    end

    def reviews
        #shows reviews for specific mentor listing
        @reviews = Review.where(mentor_id: params[:id])
    end 

    def createreview
        #request that creates review for specific mentor listing
        # render plain: review_params
        @review = Review.new(review_params)
        @review.mentor_id = params[:id]
        @review.user_id = current_user.id
        if @review.save
            redirect_to(reviews_path)
        else
            redirect_to(mentor_path(review_path))
        end
    end

    

    private

    def set_listing
        id = params[:id]
        @mentor = Mentor.find(id)
    end

    def mentor_params
        params.require(:mentor).permit(:rate, :skill_ids, :about_me)
    end

    def review_params
        params.require(:review).permit(:rating, :body)
    end

    def authorize_user
        if @mentor.user_id != current_user.id
            redirect_to mentor_path
        end
    end
end