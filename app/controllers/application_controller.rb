class ApplicationController < ActionController::API
    include ::ActionController::Cookies
    before_action :authenticate_user
    #before_action :require_login


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
                render json: {message: "NOPE!!!! Really no!"}, status: :unauthorized

                nil
            end
        end
    end


    def current_user
        if decode_jwt(cookies.signed[:jwt])
            user_id=decode_jwt(cookies.signed[:jwt])
            # decode_jwt[0]['user_id']
            
            return @user=User.find_by(id: user_id)
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


    private
  
    def require_login
      unless logged_in?
        render json: {error: "I'm pretty sure you're logged in.  This should be working.  Why isn't this working?  Log in harder."}
      end 
    end

end
