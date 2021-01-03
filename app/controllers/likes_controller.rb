class LikesController < ApplicationController
    def index
        @likes = Like.all
        render json: @likes
    end
<<<<<<< HEAD

    def create
        if (params['like']['upvote_type'] == 'Post')
            type = Post
        else
            type = Comment
        end
        @like = Like.new(like_params)
        if !@like.save
            Like.find_by(user_id: like_params[:user_id]).destroy
        end
        render json: @like
    end

    private

    def like_params
        params.require(:like).permit(:user_id, :upvote_id, :upvote_type)
    end
=======
>>>>>>> 82818f7ae472365afee32fbf09ad22f8ec700518
end
