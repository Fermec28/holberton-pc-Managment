class SubscriptionsController < ApplicationController
    def index
        if (current_user.current_pc && current_user.current_pc.status != "available")
            

            p current_user.current_pc.status != :available
            current_user.current_pc.status
            @mycomputer = current_user.current_pc
        end
        @computers = Computer.disponible
    end

    def update
        registration =  Subscription.find(params[:id])
        registration.touch
        registration.computer.update(status: :delivered)
        redirect_to :root
    end

    def create
        computer = Computer.find(params[:computer_id])
        registration = computer.subscriptions.new(user_id: current_user.id)
        if registration.save
            p "Todo salio bien"
        else
            p registration.errors.messages
        end

        redirect_to :root
    end

    private

    def registration_parameters
        params.require(:subscription)
    end
end
