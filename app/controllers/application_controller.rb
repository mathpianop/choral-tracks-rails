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

  def choir_belongs_to_admin?(admin, choir_id)
    Choir.exists?(admin_id: admin.id, choir_id: choir_id)
  end

 # Currently unused, default method
 # Use as template for other auth situations other than auth for choir
  def authorized
    render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
  end

  def authorized_for_choir
    admin = logged_in_admin
    if !admin
      render json: { message: 'Please log in' }, status: :unauthorized
    elsif !choir_belongs_to_admin?(admin, params[:choir_id])
      render json: { message: 'You do not have admin access to this choir' }, status: :unauthorized
    end
  end
end
