class Api::V1::ForecastController < ApplicationController
  def index
    forecast = ''
    render json: ForecastSerializer.new(forecast)
  end
end
