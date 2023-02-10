class Api::ChoirsController < ApplicationController
  before_action :authorized_for_choir, except: [:show]
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
      render error: { error: "Rats! Choir could not be created" }, status: 400
    end
  end

  def update
    @choir = Choir.find(params[:id])
    if @choir.update(choir_params)
      render json: @choir
    else
      render error: { error: "Rats! Choir could not be updated" }, status: 400
    end
  end

  private

  def choir_params
    params.permit(:name, :message)
  end
end