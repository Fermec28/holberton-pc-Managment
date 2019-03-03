class ConfirmationsController < ApplicationController
    def create        
        subscription =  Subscription.find(params[:subscription_id])
        subscription.create_confirmation(user_id: current_user.id)
        redirect_to computers_url
    end
end
