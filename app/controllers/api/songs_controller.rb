class Api::SongsController < ApplicationController
    # GET /songs
    def index
      # Filter out songs whose parts are not all uploaded
      @songs = Song.where('parts_count = parts_promised')
      render json: @songs
    end

    # GET /admin

    def admin
      @songs = Song.order(:id)
      @parts = Part.order(:pitch_order).group_by {|part| part.song_id}
      render json: {songs: @songs, parts: @parts}
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
        render error: { error: "Rats! Song Creation could not be completed" }, status: 400
      end
    end

    # PATCH /songs
    # PUT /songs

    def update
      @song = Song.find(params[:id]);
      if @song.update(song_params)
        render json: @song
      else
        render error: { error: "Unable to update Song." }, status: 400
      end
    end
  
    # DELETE /parts/:id
    def destroy
      @song = Song.includes(:parts).find(params[:id])
      song_parts_public_ids = @song.parts.pluck(:public_id)
      p song_parts_public_ids

      if @song.destroy
        render json: { message: "Song succesfully deleted." }, status: 200
      else
        render json: { message: "Unable to delete Song." }, status: 400
      end

      # Delete all the recordings associated with the song from Cloudinary
      song_parts_public_ids.each do |public_id|
        result = Cloudinary::Uploader.destroy(public_id, resource_type: :video)
      end
    end
  
    private
    def song_params
      params.permit(:title, :parts_promised, :id)
    end
end
