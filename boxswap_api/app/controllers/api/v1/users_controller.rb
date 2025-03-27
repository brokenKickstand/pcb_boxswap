class Api::V1::UsersController < ApplicationController
  # POST /api/v1/signup
  def create
    user = User.new(user_params) # create new user instance with parameters from request

    if user.save # try to save user to database, returns true if successful
      # Generate JWT token if user saved successfully
      token = JWT.encode({ user_id: user.id }, Rails.application.credentials.secret_key_base, 'HS256')

      # respond with token as JSON
      render json: { token: token }, status: :created
    else
      # respond with error messages if saving fails
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  # Strong parameters: Rails security feature, only allow certain params
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
