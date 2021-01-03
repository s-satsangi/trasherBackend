class ApplicationController < ActionController::API
    include ::ActionController::Cookies
    before_action :authorized

    def encode_jwt(encodable)
        # encode the info and return
        JWT.encode(encodable, Rails.application.secrets.secret_key_base)
    end

    def auth_header
        request.headers['Authorization']
    end

    def decode_jwt
        #check the headers in post for jwt
        if auth_header  
            token = auth_header.split(' ')[1]
            begin
                # decode the token, return the decoded part
                JWT.decode(token, Rails.application.secrets.secret_key_base, true, algorithm: 'HS256')
            rescue JWT::DecodeError    
                nil
            end
        end
    end

    def current_user
        if decode_jwt
            user_id=decode_jwt[0]['user_id']
            @user=User.find_by(id: user_id)
        end
    end

    def logged_in?
        !!curent_user
    end

    def authorized
        render json: {message: "You needsta log in yet"}, status: :unauthorized unless logged_in?
    end

end
