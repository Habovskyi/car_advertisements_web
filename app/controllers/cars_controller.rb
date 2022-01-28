class CarsController < ApplicationController
  def index
    @find_car = FindCar.new
    @cars = @find_car.call(search_params)
    @count = @find_car.cars_count
  end

  def show
    @car = Car.find(params[:id])
  end

  private
  def search_params
    params.permit(:make, :model, :year_from, :year_to, :price_from, :price_to, :sort_type, :sort_direction, :page)
  end
end
