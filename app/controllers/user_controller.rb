class UserController < ApplicationController
  def create_user
    param! :name, String, required: true
    user = User.create(name: params[:name], city: params[:city])
    if user.nil?
      render json: { message: 'User not created' }, status: :bad_request
    else
      render json: user, root: false
    end
  end
end
