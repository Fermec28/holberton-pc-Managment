class UsersController < ApplicationController
    def index
        @chiefs = User.by_role(:chief)
        @users = User.where.not(id: @chiefs.pluck(:id))
    end
end
