class PostsController < ApplicationController

    before_action :authenticate_user
    # maybe maybre
    # before_action :authenticate_request
    # attr_reader :current_user

    def index
        @posts = Post.all
        # .slice(params[:num].to_i, params[:num].to_i + 10)
        render json: @posts.to_json(include: [:comments, :likes])
    end

    def show
        @post = Post.find(params[:id])
        render json: @post
        render json: @posts
    end

    
#   private

#   def authenticate_request
#     @current_user = AuthorizeApiRequest.call(request.headers).result
#     render json: { error: 'Not Authorized' }, status: 401 unless @current_user
#   end
end
