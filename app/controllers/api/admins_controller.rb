class Api::AdminsController < ApplicationController
  before_action :authorized_for_admin, except: [:login, :create]
  # LOGGING IN
  def login
    @admin = Admin.find_by(email: params[:email])
    if @admin && @admin.authenticate(params[:email])
      token = encode_token({admin_id: @admin.id})
      render json: {admin: @admin, token: token, status: 200}
    else
      render json: {error: "Invalid email or password", status: 401}
    end
  end

  def create
    @admin = Admin.new(admin_params)
    if @admin.save
      token = encode_token({admin_id: @admin.id})
      render json: {admin: @admin, token: token, status: 200}
    else
      render json: { error: format(@admin.errors.first)}, status: 400
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
      render json: { error: "Unable to create Admin."}, status: 400
    end
  end

  private

  def admin_params
    params.permit(:name, :email, :password)
  end

  def format(error)
    "#{@admin.errors.first[0].to_s} #{@admin.errors.first[1]}".upcase_first
  end

end


