class ConfirmationsController < ApplicationController
    load_and_authorize_resource
    def create        
        subscription =  Subscription.find(params[:subscription_id])
        subscription.create_confirmation(user_id: current_user.id)
        redirect_to computers_url
    end
end
