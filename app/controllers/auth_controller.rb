class AuthController < ApplicationController

  def create
    user = User.find_by(username: params[:username])
    if user
      login_user(user)
    else
      user = User.new(user_params)
      if user.save
        login_user(user)
      else
        render json: {error: 'Unable to create this user :('}, status: 503
      end
    end
  end

  def show
    token = request.headers['Authorization']
    user = User.find_by(id: user_id)
    if user
      render json: {username: user.username, id: user.id}
    else
      render json: {error: 'Invalid user token :('}, status: 401
    end
  end

  private
  def user_params
    params.permit(:username, :password)
  end

end
