class AuthController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def create
        # byebug
        @user = User.find_by(username: user_login_params[:username])
        if @user && @user.authenticate(user_login_params[:password])
            token=encode_jwt({user_id: @user.id})
            cookies.signed[:jwt] = {value:  token, httponly: true}
            render json: {user: @user.username}, status: :accepted
        else
            render json: { message: "Invalid username or password"}, status: :unauthorized
         end
    end

    private

    def user_login_params
        params.require(:user).permit(:username, :password)
    end

end
