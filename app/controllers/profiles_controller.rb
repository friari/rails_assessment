class ProfilesController < ApplicationController
    def index
        @bookings = User.find(current_user.id).bookings 
        @user_booking = User.find(current_user.id).bookings
    end
    
end
