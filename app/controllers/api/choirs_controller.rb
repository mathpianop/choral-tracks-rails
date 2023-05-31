class Api::ChoirsController < ApplicationController
  before_action :authorized_for_choir, except: [:show, :create]
  before_action :authorized_for_admin, only: [:create]
  def show
    # Filter out songs whose parts are not all uploaded
    @choir = Choir.find(params[:id])
    @songs = Song.where(choir_id: params[:id])
    render json: {songs: @songs, choir_details: @choir}
  end

  def edit
    @choir = Choir.find(params[:id])
    @songs = Song.where(choir_id: params[:id])
    render json: {songs: @songs, choir_details: @choir}
  end

  def create
    @choir = Choir.new(choir_params)
    if @choir.save
      render json: @choir
    else
      render json: { error: format(@choir.errors.first) }, status: 400
    end
  end

  def update
    @choir = Choir.find(params[:id])
    if @choir.update(choir_params)
      render json: @choir
    else
      render json: { error: format(@choir.errors.first) }, status: 400
    end
  end

  def destroy
    @choir = Choir.includes(:songs).find(params[:id])
    if @choir.destroy
      render json: { message: "Choir succesfully deleted." }, status: 200
    else
      render json: { message: "Unable to delete Choir." }, status: 400
    end
  end


  private


  def choir_params
    params.permit(:name, :message, :admin_id)
  end
end