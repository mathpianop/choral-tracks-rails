class ApplicationController < ActionController::API
  
  def encode_token(payload)
    JWT.encode(payload, ENV['JWT_SECRET'])
  end

  def auth_header
    # { Authorization: 'Bearer <token>' }
    request.headers['Authorization']
  end

  def decoded_token
    if auth_header
      token = auth_header.split(' ')[1]
      # header: { 'Authorization': 'Bearer <token>' }
      begin
        JWT.decode(token, ENV['JWT_SECRET'], true, algorithm: 'HS256')
      rescue JWT::DecodeError
        nil
      end
    end
  end

  def logged_in_admin
    if decoded_token
      admin_id = decoded_token[0]['admin_id']
      @admin = Admin.find_by(id: admin_id)
    end
  end

  def logged_in?
    !!logged_in_admin
  end

  def authorized
    render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
  end
end
