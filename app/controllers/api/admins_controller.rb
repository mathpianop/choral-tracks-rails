class Api::AdminsController < ApplicationController
  before_action :authorized_for_admin, except: [:login]
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
    @choirs = Choir.includes(:songs).where(admin_id: params[:id])
    @songs = Song.where(choir_id: @choirs.map {|choir| choir.id})
    # For each choir, create a parent hash that has choir_details 
    # (the actual choir record) and songs.
    choirs_and_songs = @choirs.map {|choir| {choir_details: choir, songs: choir.songs}}
    render json: {admin: @admin, choirs: choirs_and_songs}
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


