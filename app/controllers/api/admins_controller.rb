class Api::AdminsController < ApplicationController
  # LOGGING IN
  def login
    @admin = Admin.find_by(username: params[:username])
    p "Hello"
    if @admin && @admin.authenticate(params[:password])
      token = encode_token({admin_id: @admin.id})
      render json: {admin: @admin, token: token, status: 200}
    else
      p "Hello"
      render json: {error: "Invalid username or password", status: 401}
    end
  end
end
