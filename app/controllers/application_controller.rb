class ApplicationController < ActionController::API
  before_action :authorized

  def secret
    'besttodolistever'
  end

  def encode_token(data)
    JWT.encode(data, secret)
  end

  def auth_header
    request.headers['Authorization']
  end

  def decoded_token
    if auth_header
      token = auth_header
      begin
        JWT.decode(token, secret)
      rescue JWT::DecodeError
        nil
      end
    end
  end

  def current_user
    if decoded_token
      user_id = decoded_token[0]['user_id']
      User.find_by(id: user_id)
    end
  end

  def logged_in?
    # !!current_user
    true
  end

  def authorized
    render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
  end
end
