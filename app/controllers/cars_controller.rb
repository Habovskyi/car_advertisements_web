class CarsController < ApplicationController
  def index
    @cars = Car.new.call(search_params).page params[:page]
  end

  def show
    @car = Car.find(params[:id])
  end

  private

  def search_params
    params.permit(:make, :model, :year_from, :year_to, :price_from, :price_to, :sort_type, :sort_direction, :page)
  end
end
