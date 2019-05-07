class ProfilesController < ApplicationController
    def index
        @user_booking = User.find(current_user.id).bookings
        @mentor_details = User.find(current_user.id).mentor
    end
    
end
