class Api::PartsController < ApplicationController
 
  def index
    @parts = Part.all
    render json: @parts
  end

  def show
    @part = Part.find(params[:id])
    render json: @part
  end

  def create
    @part = Part.new(part_params)
    if @part.save
      render json: @part
    else
      render error: { error: "Unable to create Part." }, status: 400
    end
  end

  def destroy
    @part = Part.find(params[:id])
    if @part
      @part.destroy
      render json: { message: "Part succesfully deleted." }, status: 200
    else
      render json: { message: "Unable to delete Part." }, status: 400
    end
  end

  private
  def part_params
    params.require(:part).permit(:title)
  end
end
