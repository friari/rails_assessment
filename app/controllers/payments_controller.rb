class PaymentsController < ApplicationController

     skip_before_action :verify_authenticity_token
    def stripe
        
        # user_id = params[:data][:object][:client_reference_id]
        payment_id = params[:data][:object][:payment_intent]
        payment = Stripe::PaymentIntent.retrieve(payment_id)
        booking_params = {mentor_id: payment.metadata.mentor_id,
                          user_id: payment.metadata.user_id,
                          stripe_transaction: payment.id }
        # mentor_id = payment.metadata.mentor_id
        # user_id = payment.metadata.user_id
        # stripe_transaction = payment.id
        Booking.create(booking_params)
        
        p "mentor id " + mentor_id
        p "user id" + user_id
        render json: ""
        # p "Hello"
        # render json: "Hello"

       
    end

    def success
        p params
        id = Mentor.ids
        @mentor = Mentor.find(id)
      
        
        

    end

    def booking
        @booking = Booking.new()
    end
end