class Api::AdminsController < ApplicationController
  before_action :authorized, only: [:auto_login]

  # LOGGING IN
  def login
    @admin = Admin.find_by(username: params[:username])

    if @admin && @admin.authenticate(params[:password])
      token = encode_token({admin_id: @admin.id})
      render json: {admin: @admin, token: token}
    else
      render json: {error: "Invalid username or password"}
    end
  end

  def auto_login
    render json: @admin
  end
end
