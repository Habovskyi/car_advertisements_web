require 'ffaker'

namespace :car do
  desc 'Generate 50 cars'
  task create: :environment do
    100.times do
      Car.create(
        make: FFaker::Vehicle.make,
        model: FFaker::Vehicle.model,
        year: FFaker::Vehicle.year.to_i,
        odometer: FFaker::Number.rand(0..500_000).to_i,
        price: FFaker::Number.rand(10..1000) * 100.to_i,
        description: FFaker::Lorem.sentence
      )
    end
  end
end
