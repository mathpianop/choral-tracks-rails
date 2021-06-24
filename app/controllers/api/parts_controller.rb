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
    @part.recording = result["secure_url"]
    @part.public_id = result["public_id"]
    if @part.save
      render json: @part
    else
      render error: { error: "Unable to create Part." }, status: 400
    end
  end

  def update
    @part = Part.find(params[:id])
    update_params = part_params
    current_public_id = @part.public_id
    update_params.except(:recording)

    if part_params[:recording] == "existing"
      # If there is not a new recording, remove the :recording key from the params
      update_params = part_params.except(:recording)
    else
      #If the recording is being overriden, upload the file and replace
      #it with the new url
      result = Cloudinary::Uploader.upload(params[:recording], resource_type: :video)
      update_params = part_params.except(:recording).merge({
        recording: result["secure_url"],
        public_id: result["public_id"]
      })
      #Delete the previous recording
      Cloudinary::Uploader.destroy(current_public_id, resource_type: :video)
    end
    
    if @part.update(update_params)
      render json: @part
    else
      render error: { error: "Unable to update Part." }, status: 400
    end
  end

  def destroy
    @part = Part.find(params[:id])
    if @part.destroy
      render json: { message: "Part succesfully deleted." }, status: 200
    else
      render json: { message: "Unable to delete Part." }, status: 400
    end
    result = Cloudinary::Uploader.destroy(@part.public_id, resource_type: :video)
  end

  private
  def part_params
    params.permit(:name, :initial, :recording, :song_id, :pitch_order, :id)
  end
end
