class PaymentsController < ApplicationController

     skip_before_action :verify_authenticity_token
    def stripe
        user_id = params[:data][:object][:client_reference_id]
        payment_id = params[:data][:object][:payment_intent]
        payment = Stripe::PaymentIntent.retrieve(payment_id)
        mentor_id = payment.metadata.mentor_id
        
        p "mentor id" + mentor_id
        p "user id" + user_id
        render json: ""
    end

    def success

        

    end

    def booking
        @booking = Booking.new()
    end
end