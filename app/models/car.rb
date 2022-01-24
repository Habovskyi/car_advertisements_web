class Car < ApplicationRecord
  validates :make, :model, length: { in: 2..50 }, format: {
    with: /[a-zA-Z]/,
    message: 'Please, use english letter!'
  }, presence: true
  validates :year, comparison: { greater_than: 1900, less_than_or_equal_to: Date.current.year },
                   numericality: { only_integer: true }, presence: true
  validates :price, :odometer, numericality: { only_integer: true }, comparison: { greater_than: 0 }, presence: true
  validates :description, length: { maximum: 500 }, presence: true
end
