class Api::V1::MunchiesController < ApplicationController
  def index
    munchie = MunchiesFacade.munchie(munchies_params)
    render json: MunchieSerializer.new(munchie)
  end

  private

  def munchies_params
    params.permit(:start, :end_location, :food)
  end
end
