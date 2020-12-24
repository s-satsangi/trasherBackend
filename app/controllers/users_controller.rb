class UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def profile
    render json: { user: current_user.username}, status: :accepted
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def create
    # byebug
    @user=User.create(user_params)
    # if we add validations check if user is valid, then
    @token = encode_jwt(@user.id)
    render json: {user: @user.username, jwt: @token}, status: :created
    # if user is not valid:
    # render json: {error: 'user create failure'}, status: :not_acceptable
  end

  def delete
  end

  def update
  end
  
  private

  def user_params
      params.require(:user).permit(:first_name, :last_name, :username, :password)
  end

end
