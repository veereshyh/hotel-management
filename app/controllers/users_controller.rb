class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    user = Services::User.new(user_params).create
    render json: "Created user with name #{user.name} succesfully"
  end

  def show
    # render json: load_user
  end

  def update
    #user = load_user
    #user.update(params)
  end

  private

  def user_params
    params.require(:user).permit(:name, :address, :gender)
  end

  def load_user
    #User.find_by_id(sanitized_params_id)
  end
end
