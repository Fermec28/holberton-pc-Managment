class SubscriptionsController < ApplicationController
    def index
        if (current_user.current_pc && current_user.current_pc.status != "available")
            @mycomputer = current_user.current_pc
        end
        @computers = Computer.disponible
    end

    def update
        subscription =  Subscription.find(params[:id])
        subscription.touch
        subscription.computer.update(status: :delivered)
        flash[:info] = "The chief will check your pc have a nice day!"
        redirect_to :root
    end

    def create
        computer = Computer.find(params[:computer_id])
        subscription = computer.subscriptions.new(user_id: current_user.id)
        if subscription.save
            flash[:success] = ["Take care your PC","Learn a lot"]
        else             
            flash[:danger] = subscription.errors.full_messages
        end

        redirect_to :root
    end

    private

    def registration_parameters
        params.require(:subscription)
    end
end
