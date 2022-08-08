class Api::PartsController < ApplicationController
  before_action :authorized_for_part, only: [:update, :destroy]
  before_action :authorized_for_song, only: :create
  
  def index
    @parts = Part.order(:pitch_order).where(song_id: part_params[:song_id])
    render json: @parts
  end

  def show
    @part = Part.find(params[:id])
    render json: @part
  end

  def create
    #Upload recording and add resulting info to params
    upload_result = upload_recording(params[:recording])
    modified_params = add_result_to_params(upload_result, part_params)
    @part = Part.new(modified_params)

    if @part.save
      render json: @part
    else
      render error: { error: "Unable to create Part." }, status: 400
    end
  end

  def update
    @part = Part.find(params[:id])
    current_public_id = @part.public_id
    #Return part_params without the :recording key
    update_params = part_params.except(:recording)
    unless part_params[:recording] == "existing"
      #If the recording is being overriden, upload the file and replace
      #it with the new url
      upload_result = upload_recording(params[:recording])
      modified_params = add_result_to_params(upload_result, update_params)
      #Delete the previous Cloudinary recording file
      delete_uploaded_recording(current_public_id)
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
    #Delete corresponding Cloudinary file
    delete_uploaded_recording(@part.public_id)
  end

  private
  def upload_recording(recording)
    
    if !params[:recording]
      p params[:recording]
      render json: { message: "Recording missing" }, status: 400
    else
      Cloudinary::Uploader.upload(params[:recording], resource_type: :video)
    end
  end

  def delete_uploaded_recording(public_id)
    Cloudinary::Uploader.destroy(public_id, resource_type: :video)
  end

  def add_result_to_params(upload_result, input_params)
    input_params.merge({
      recording: upload_result["secure_url"],
      public_id: upload_result["public_id"]
    })
  end

  def part_params
    params.permit(:name, :initial, :recording, :song_id, :pitch_order, :id)
  end
end
