class Api::V1::MunchiesController < ApplicationController
  def index
    munchie = MunchiesFacade.munchie(munchies_params)
    render json: MunchiesSerializer.new(munchie)
  end

  private

  def munchies_params
    params.permit(:start, :end, :food)
  end
end
