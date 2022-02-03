class Car < ApplicationRecord
  validates :make, :model, length: { in: 2..50 }, format: {
    with: /[a-zA-Z0-9\-]/,
    message: 'Please, use english letter!'
  }, presence: true
  validates :year, comparison: { greater_than: 1900, less_than_or_equal_to: Date.current.year },
                   numericality: { only_integer: true }, presence: true
  validates :price, :odometer, numericality: { only_integer: true }, comparison: { greater_than: 0 }, presence: true
  validates :description, length: { maximum: 500 }, presence: true

  def call(params)
    searched_cars = search(params)
    searched_cars.sorter(params[:sort_type] ||= :created_at, params[:sort_direction] ||= :desc)
  end

  private

  def search(params)
    result = Car.filter_by_make(params[:make]).filter_by_model(params[:model])
    result = result.filter_by_year_from(params[:year_from]).filter_by_year_to(params[:year_to])
    result.filter_by_price_from(params[:price_from]).filter_by_price_to(params[:price_to])
  end

  scope :filter_by_make, ->(make) { where('make ILIKE ?', make) if make.present? }
  scope :filter_by_model, ->(model) { where('model ILIKE ?', model) if model.present? }
  scope :filter_by_year_from, ->(year_from) { where('year >= ?', year_from) if year_from.present? }
  scope :filter_by_year_to, ->(year_to) { where('year <= ? ', year_to) if year_to.present? }
  scope :filter_by_price_from, ->(price_from) { where('price >= ?', price_from) if price_from.present? }
  scope :filter_by_price_to, ->(price_to) { where('price <= ?', price_to) if price_to.present? }
  scope :sorter, ->(type, direction) { order(type => direction) }
end
