class Api::AdminsController < ApplicationController
  # LOGGING IN
  def login
    @admin = Admin.find_by(username: params[:username])
    if @admin && @admin.authenticate(params[:password])
      token = encode_token({admin_id: @admin.id})
      render json: {admin: @admin, token: token, status: 200}
    else
      render json: {error: "Invalid username or password", status: 401}
    end
  end

  # Returns admin page data
  def show
    @admin = Admin.find(params[:id]);
    @choirs = Choir.where(admin_id: params[:id])
    render json: {admin: @admin, choirs: @choirs}
  end

  def update
    @admin = Admin.find(params[:id]);
    if @admin.update(admin_params)
      render json: @admin
    else
      render error: { error: "Unable to update Admin." }, status: 400
    end
  end

  private

  def admin_params
    params.permit(:name)
  end



end


