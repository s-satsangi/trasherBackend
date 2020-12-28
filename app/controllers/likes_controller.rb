class LikesController < ApplicationController
    def index
        @likes = Like.all
        render json: @likes
    end

    def create
        if (params['like']['upvote_type'] == 'Post')
            type = Post
        else
            type = Comment
        end
        @like = Like.new(like_params)
        puts @like.save
        render json: @like
    end

    private

    def like_params
        params.require(:like).permit(:user_id, :upvote_id, :upvote_type)
    end
end
