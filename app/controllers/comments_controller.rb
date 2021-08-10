class CommentsController < ApplicationController
    before_action :find_post
    def create
        @post.comments.create(comment_params)
        redirect_to main_path
    end
    
    private
    def find_post
      @post = Post.find(params[:post_id])
    end

    def comment_params
        params.require(:comment).permit(:body, :post_id, :user_id).with_defaults(user_id: current_user.id, post_id: params[:post_id])
    end 
end
