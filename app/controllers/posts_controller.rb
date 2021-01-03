class PostsController < ApplicationController

    def index
        @posts = Post.all
<<<<<<< HEAD
        # .slice(params[:num].to_i, params[:num].to_i + 10)
        render json: @posts.to_json(include: [:comments, :likes])
    end

    def show
        @post = Post.find(params[:id])
        render json: @post
=======
        render json: @posts
>>>>>>> 82818f7ae472365afee32fbf09ad22f8ec700518
    end
end
