class Car < ApplicationRecord
  validates :make, :model, length: { in: 2..50 }, format: {
    with: /[a-zA-Z]/,
    message: 'Please, use english letter!'
  }, presence: true
  validates :year, comparison: { greater_than: 1900, less_than_or_equal_to: Date.current.year },
                   numericality: { only_integer: true }, presence: true
  validates :price, :odometer, numericality: { only_integer: true }, comparison: { greater_than: 0 }, presence: true
  validates :description, length: { maximum: 500 }, presence: true

  def call(params)
    search(params).sorter(params[:sort_type] ||= :created_at, params[:sort_direction] ||= :desc).page params[:page]
  end

  def search(params)
    result = Car.make(params[:make]).mode(params[:model])
    result = result.year_from(params[:year_from]).year_to(params[:year_to])
    result.price_from(params[:price_from]).price_to(params[:price_to])
  end

  scope :make, ->(make) { where('make LIKE ?', make) if make.present? }
  scope :mode, ->(model) { where('model LIKE ?', model) if model.present? }
  scope :year_from, ->(year_from) { where('year >= ?', year_from) if year_from.present? }
  scope :year_to, ->(year_to) { where('year <= ? ', year_to) if year_to.present? }
  scope :price_from, ->(price_from) { where('price >= ?', price_from) if price_from.present? }
  scope :price_to, ->(price_to) { where('price <= ?', price_to) if price_to.present? }
  scope :sorter, ->(type, direction) { order(type => direction) }
end
