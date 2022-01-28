class FindCar
  attr_reader :cars_count

  def initialize(cars = Car.all)
    @cars = cars
    @cars_count = nil
  end

  def call(params)
    scoped = make(@cars, params[:make])
    scoped = model(scoped, params[:model])
    scoped = year(scoped, params[:year_from], params[:year_to])
    scoped = price(scoped, params[:price_from], params[:price_to])
    @cars_count = scoped.count
    scoped = sort(scoped, params[:sort_type], params[:sort_direction])
    scoped.page params[:page]
    
  end

  private

  def make(scoped, query)
    query.present? ? scoped.where('lower(make) LIKE ?', query.downcase) : scoped
  end

  def model(scoped, query)
    query.present? ? scoped.where('lower(model) LIKE ?', query.downcase) : scoped
  end

  def year(scoped, query_from, query_to)
    query_from.present? ? scoped.where('year_from >= ?', query_from) : scoped
    query_to.present? ? scoped.where('year_to <= ?', query_to) : scoped
  end

  def price(scoped, query_from, query_to)
    query_from.present? ? scoped.where('price_from >= ?', query_from) : scoped
    query_to.present? ? scoped.where('price_to <= ?', query_to) : scoped
  end

  def sort(scoped, sort_type, sort_direction)
    sort_direction ||= :desc
    sort_type ||= :price
    scoped.order(sort_type => sort_direction)
  end
end
