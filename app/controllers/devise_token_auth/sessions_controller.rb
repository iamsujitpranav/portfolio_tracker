module DeviseTokenAuth
  class SessionsController < ApplicationController
    skip_before_action :authenticate_user!, only: :create

    def create
      auth_params = authentication_params

      authentication_token = UserAuthenticationService.authenticate(auth_params[:email], auth_params[:password])

      if authentication_token
        render json: { success: true, data: authentication_token }
      else
        render json: { success: false, message: 'Invalid credentials' }, status: :unauthorized
      end
    end

    private

    def authentication_params
      params.require(:session).permit(:email, :password)
    end
  end
end
