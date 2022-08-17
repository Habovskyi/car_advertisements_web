FactoryBot.define do
  factory :search do
    make { FFaker::Vehicle.make }
    model { FFaker::Vehicle.model }
    year_from { FFaker::Vehicle.year }
    year_to { FFaker::Vehicle.year }
    price_from { FFaker::Number.rand(10..1000) * 100 }
    price_to { FFaker::Number.rand(10..1000) * 100 }
    user
  end
end
