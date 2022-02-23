class Api::ChoirsController < ApplicationController
  before_action :authorized, except: [:show]
  def show
    # Filter out songs whose parts are not all uploaded
    @choir = Choir.find(params[:id]);
    @songs = Song.where('parts_count = parts_promised').where(choir_id: params[:id])
    p @songs
    p params[:id]
    render json: {songs: @songs, choir_details: @choir}
  end

  def create
  end

  def update
  end
end