class ProfilesController < ApplicationController
    def index
        @user_booking = User.find(current_user.id).bookings
        @mentor_details = User.find(current_user.id).mentor
        @mentor_clients = User.find(current_user.id).bookings
        
        
        # @booking_date = User.find(current_user.id).bookings.created_at
    end
    
end
