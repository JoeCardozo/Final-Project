class UsersController < ApplicationController
    def new
    end

    def create
        name = params[:user][:name]
        user = User.create(name: name)
        session[:user_id] = user.id
        redirect_to :root
    end
end
