class PostsController < ApplicationController

    def index
        @posts = Post.all.slice(params[:num].to_i, params[:num].to_i + 10)
        render json: @posts.to_json(include: [:comments, :likes])
    end

    def show
        @post = Post.find(params[:id])
        render json: @post
    end
end
