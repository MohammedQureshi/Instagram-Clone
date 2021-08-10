class ProfilesController < ApplicationController
    before_action :authenticate_user!
    def show
        Current.user = current_user
        @user = User.find_by(username: params[:id])
        @posts = @user.posts
    end 
end 