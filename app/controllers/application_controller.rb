class ApplicationController < ActionController::API
    include ::ActionController::Cookies
    before_action :authenticate_user

    def encode_jwt(encodable)
        # encode the info and return
        JWT.encode(encodable, Rails.application.secrets.secret_key_base)
    end

    def auth_header
        request.headers['Authorization']
    end

    def decode_jwt(jwt)
        #check the headers in post for jwt
        # byebug
        if auth_header  
            # token = cookies.signed[:jwt]
            # auth_header.split(' ')[1]
            begin
                # decode the token, return the decoded part
                JWT.decode(jwt, Rails.application.secrets.secret_key_base, true, algorithm: 'HS256')
            rescue JWT::DecodeError 
                # byebug 
                render json: {message: "NOPE!!!! Really no!"}, status: :unauthorised

                nil
            end
        end
    end


    def current_user
        if decode_jwt(cookies.signed[:jwt])
            user_id=decode_jwt(cookies.signed[:jwt])
            # decode_jwt[0]['user_id']
            @user=User.find_by(id: user_id)
        end
    end

    def logged_in?
        !!current_user
    end

    def authenticate_user
        # byebug
        jwt = cookies.signed[:jwt]
        decode_jwt(jwt)
    end

end
