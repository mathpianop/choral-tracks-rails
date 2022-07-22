class Api::ChoirsController < ApplicationController
  before_action :authorized_for_choir, except: [:show]
  def show
    # Filter out songs whose parts are not all uploaded
    @choir = Choir.find(params[:id]);
    @songs = Song.where('parts_count = parts_promised').where(choir_id: params[:id])
    render json: {songs: @songs, choir_details: @choir}
  end

  def edit
    @songs = Song.where(choir_id: params[:id]).order(:id)
    @parts = Part.where(song_id: @songs).order(:pitch_order).group_by {|part| part.song_id}
    render json: {songs: @songs, parts: @parts}
  end

  def create
  end

  def update
  end
end