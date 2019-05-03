class PaymentsController < ApplicationController

    def stripe
        p params
    end

    def success

        

    end

    def booking
        @booking = Booking.new()
    end
end