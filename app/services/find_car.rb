class FindCar
  def self.call(*args)
    new(*args).call
  end

  def initialize(params)
    @params = params
    @cars = Car.all
  end

  def call
    filter_by_name
    filter_by_year
    filter_by_price
    sorter
  end

  private

  def filter_by_name
    @cars = @cars.filter_by_make(@params[:make]) if @params[:make].present?
    @cars = @cars.filter_by_model(@params[:model]) if @params[:model].present?
  end

  def filter_by_year
    @cars = @cars.filter_by_year_from(@params[:year_from]) if @params[:year_from].present?
    @cars = @cars.filter_by_year_to(@params[:year_to]) if @params[:year_to].present?
  end

  def filter_by_price
    @cars = @cars.filter_by_price_from(@params[:price_from]) if @params[:price_from].present?
    @cars = @cars.filter_by_price_to(@params[:price_to]) if @params[:price_to].present?
  end

  def sorter
    @cars.filter_by_order(@params[:sort_type] ||= :created_at, @params[:sort_direction] ||= :desc)
  end
end
