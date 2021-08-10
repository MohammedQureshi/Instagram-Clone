class MainController < ApplicationController
    before_action :authenticate_user!
    def index
        Current.user = current_user
        @followedUsers = Current.user.following.ids
        @posts = Post.where(id: @followedUsers).order("created_at DESC")
    end 
end 