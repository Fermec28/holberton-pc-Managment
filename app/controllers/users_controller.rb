class UsersController < ApplicationController
    load_and_authorize_resource
    def index
        @chiefs = User.by_role(:chief)
        @users = User.where.not(id: @chiefs.pluck(:id))
    end

    def chief_role
        user = User.find(params[:id])
        unless user.has_role? :chief
            user.add_role :chief
        else
            user.remove_role :chief
        end

        redirect_to admin_path
    end
end