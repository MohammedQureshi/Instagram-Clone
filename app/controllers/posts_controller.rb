class PostsController < ApplicationController
    before_action :set_post, only: [:show, :destroy, :index]
    def new
        Current.user = current_user
        @post = Post.new
    end 
    def create 
        @post = current_user.posts.new(post_params)
        if @post.save
            redirect_to main_path
        else 
            render :new
        end 
    end 

    def destroy
        @post.destroy
        redirect_to request.referrer
    end 

    def show
        Current.user = current_user
    end

    private 
    def post_params
        params.require(:post).permit(:post_id, :body, :postimage)
    end 

    def set_post
        @post = Post.find(params[:id])
    end
end 