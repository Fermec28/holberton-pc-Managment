class ComputersController < ApplicationController
    load_and_authorize_resource
    def index
        @cavailable = Computer.computers_status(:available)
        @con_loane = Computer.computers_status(:on_loan)
        @cdeliverede = Computer.computers_status(:delivered)
    end
end
