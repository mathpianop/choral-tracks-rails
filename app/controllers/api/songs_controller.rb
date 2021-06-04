class Api::SongsController < ApplicationController
    # GET /songs
    def index
      @songs = Song.all
      render json: @songs
    end
  
    # GET /song/:id
    def show
      @song = Song.find(params[:id])
      render json: @song
    end
  
    # POST /songs
    def create
      @song = Song.new(song_params)
      if @song.save
        render json: @song
      else
        render error: { error: "Unable to create Song." }, status: 400
      end
    end
  
    # DELETE /parts/:id
    def destroy
      @song = Song.find(params[:id])
      if @song
        @song.destroy
        render json: { message: "Song succesfully deleted." }, status: 200
      else
        render json: { message: "Unable to delete Song." }, status: 400
      end
    end
  
    private
    def song_params
      params.require(:song).permit(:title)
    end
end
