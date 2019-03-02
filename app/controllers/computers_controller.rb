class ComputersController < ApplicationController
    def index
        if (current_user.current_pc && current_user.current_pc.status != 0)
            @mycomputer = current_user.current_pc
        end
        @computers = Computer.disponible
    end
end
