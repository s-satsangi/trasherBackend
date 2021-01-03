class CommentsController < ApplicationController
    def index
        @comments = Comment.all.sort_by :created_at
        render json: @comments
    end

    def create
        @comment = Comment.new comment_params
        if @comment.save

        end
        render json: @comment
    end

    private

    def comment_params
        params.require(:comment).permit(:text, :user_id, :post_id)
    end
end
