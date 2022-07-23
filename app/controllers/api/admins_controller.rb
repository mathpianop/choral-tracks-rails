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
    @songs = Song.order(:id)
    @parts = Part.order(:pitch_order).group_by {|part| part.song_id}
    render json: {songs: @songs, parts: @parts}
  end



end


