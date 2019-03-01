class RegistrationsController < ApplicationController
    def index
        if (current_user.current_pc && !current_user.current_pc.available)
            @mycomputer = current_user.current_pc
        end
        @computers = Computer.disponible       
    end

    def update
        registration =  Registration.find(params[:id])
        registration.touch
        redirect_to :root
    end

    def create
        computer = Computer.find(params[:computer_id])
        registration = computer.registrations.new(user_id: current_user.id)
        if registration.save
            redirect_to :root
        else
            p registration.errors.all
        end
    end

    private

    def registration_parameters
        params.require(:registration)
    end
end
