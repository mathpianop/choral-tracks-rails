class Api::PartsController < ApplicationController
  def index
    @parts = Part.order(:pitch_order).where(song_id: part_params[:song_id])
    render json: @parts
  end

  def show
    @part = Part.find(params[:id])
    render json: @part
  end

  def create
    @part = Part.new(part_params)
    result = Cloudinary::Uploader.upload(params[:recording], resource_type: :video)
    @part.recording = result["url"]
    if @part.save
      render json: @part
    else
      render error: { error: "Unable to create Part." }, status: 400
    end
  end

  def update
    @part = Part.find(params[:id])
    update_params = part_params
    current_recording = @part.recording

    if part_params[:recording] == "existing"
      update_params.except(:recording)
    else
      result = Cloudinary::Uploader.upload(params[:recording], resource_type: :video)
      update_params.recording = result["url"]
      #Delete the previous recording
      Cloudinary::Uploader.destroy(current_recording, resource_type: :video)
    end
    
    if @part.update(update_params)
      render json: @part
    else
      render error: { error: "Unable to update Part." }, status: 400
    end
  end

  def destroy
    @part = Part.find(params[:id])
    Cloudinary::Uploader.destroy(@part.recording, resource_type: :video)
    if @part
      @part.destroy
      render json: { message: "Part succesfully deleted." }, status: 200
    else
      render json: { message: "Unable to delete Part." }, status: 400
    end
  end

  private
  def part_params
    params.permit(:name, :initial, :recording, :song_id, :pitch_order, :id)
  end


end
