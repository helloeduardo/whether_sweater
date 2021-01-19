class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: user_params[:email])

    if user.present? && user.authenticate(user_params[:password])
      render json: UserSerializer.new(user)
    else
      render json: { error: 'invalid credentials' }, status: :bad_request
    end
  end

  private

  def user_params
    params.permit(:email, :password)
  end
end
