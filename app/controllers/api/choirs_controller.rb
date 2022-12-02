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
  end

  def update
  end
end