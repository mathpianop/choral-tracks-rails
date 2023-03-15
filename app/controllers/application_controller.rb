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
      rescue => error
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

  def params_admin_id
    params[:admin_id] || params[:id]
  end

  def params_choir_id
    params[:choir_id] || params[:id]
  end

  def params_song_id
    params[:song_id] || params[:id]
  end

  def choir_belongs_to_admin?(admin)
    admin.choirs.exists?(id: params_choir_id)
  end

  def record_belongs_to_admin?(admin)
    admin.id == params_admin_id.to_i
  end

  def song_belongs_to_admin?(admin)
    admin.songs.exists?(id: params_song_id)
  end

  def part_belongs_to_admin?(admin)
    admin.parts.exists?(id: params_admin_id)
  end
  

 # default method
 # Use as template for other auth situations other than auth for choir
  def authorized
    render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
  end

  def authorized_for_admin
    admin = logged_in_admin
    if !admin
      render json: { message: 'Please log in' }, status: :unauthorized
    elsif !record_belongs_to_admin?(admin)
      render json: { message: 'You do not have access to this account' }, status: :unauthorized
    end
  end

  def authorized_for_choir
    admin = logged_in_admin
    if !admin
      render json: { message: 'Please log in' }, status: :unauthorized
    elsif !choir_belongs_to_admin?(admin)
      render json: { message: 'You do not have admin access to this choir or this choir does not exist' }, status: :unauthorized
    end
  end
  
  def authorized_for_song
    admin = logged_in_admin
 
    if !admin
      render json: { message: 'Please log in' }, status: :unauthorized
    elsif !song_belongs_to_admin?(admin)
      render json: { message: 'You do not have admin access to this song or this song does not exist' }, status: :unauthorized
    end
  end

  def authorized_for_part
    admin = logged_in_admin
    if !admin
      render json: { message: 'Please log in' }, status: :unauthorized
    elsif !part_belongs_to_admin?(admin)
      render json: { message: 'You do not have admin access to this part or this part does not exist' }, status: :unauthorized
    end
  end


end
