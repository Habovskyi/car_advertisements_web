class CarsController < ApplicationController
  def index
    @cars = Search.engine(search_params)
    @count = @cars.count
    @cars = @cars.order(params[:sort_type]).page params[:page]
    @search_params = search_params
  end

  def show
    @car = Car.find(params[:id])
  end

  private

  def sort_params
    params.permit(:sort_type)
  end

  def search_params
    params.permit(:make, :model, :year_from, :year_to, :price_from, :price_to)
  end
end
