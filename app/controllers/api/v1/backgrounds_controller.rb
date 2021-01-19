class Api::V1::BackgroundsController < ApplicationController
  def index
    image = ImageFacade.image(params[:location])
    render json: ImageSerializer.new(image)
  end
end
