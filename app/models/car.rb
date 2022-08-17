class Car < ApplicationRecord
  validates :make, :model, length: { in: 2..50 }, format: {
    with: /[a-zA-Z0-9\-]/,
    message: 'Please, use english letter!'
  }, presence: true
  validates :year, comparison: { greater_than_or_equal_to: 1900, less_than_or_equal_to: Date.current.year },
                   numericality: { only_integer: true }, presence: true
  validates :price, :odometer, numericality: { only_integer: true }, comparison: { greater_than: 0 }, presence: true
  validates :description, length: { maximum: 500 }, presence: true

  scope :filter_by_make, ->(make) { where('make ILIKE ?', make) }
  scope :filter_by_model, ->(model) { where('model ILIKE ?', model) }
  scope :filter_by_year_from, ->(year_from) { where('year >= ?', year_from) }
  scope :filter_by_year_to, ->(year_to) { where('year <= ? ', year_to) }
  scope :filter_by_price_from, ->(price_from) { where('price >= ?', price_from) }
  scope :filter_by_price_to, ->(price_to) { where('price <= ?', price_to) }
  scope :filter_by_order, ->(type, direction) { order(type => direction) }
end
