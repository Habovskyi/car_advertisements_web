FactoryBot.define do
  factory :car do
    make { FFaker::Vehicle.make }
    model { FFaker::Vehicle.model }
    year { FFaker::Vehicle.year }
    odometer { FFaker::Number.rand(500_000) }
    price { FFaker::Number.rand(10..1000) * 100 }
    description { FFaker::Lorem.sentence }
  end
end
