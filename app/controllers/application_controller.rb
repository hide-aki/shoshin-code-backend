class ApplicationController < ActionController::API

  def token
    request.headers['Authorization']
  end

  def current_user
    @current_user ||= User.find_by(id: user_id) #temp find by id directly
  end

  def user_id
    current_user.id
  end

  # (return encoded token using user id as payload, SHA-256 algorithm)
  def issue_token(payload)
    JWT.encode(payload, ENV['codewars_api_key'], 'HS256') 
  end

  def decoded_token
    begin
      JWT.decode( token, ENV['codewars_api_key'], true, { algorithm: 'HS256' } )
    rescue JWT::DecodeError  # rescue if decode blows up, return something with correct shape, so user_id will be nil
      [{}]
    end
  end

  def user_id
    decoded_token.first['user_id']
  end

  def login_user(user)
    if user.authenticate(params[:password])
      token = issue_token user_id: user.id, username: user.username # , jwt: token
      render json: {id: user.id, username: user.username, jwt: token}
    else
      render json: {error: "Sorry, cannot find that user :("}, status: 401 # unauthorized
    end
  end

end
