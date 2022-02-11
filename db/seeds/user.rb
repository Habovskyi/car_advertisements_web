user_one = User.create!(email: 'user1@gmail.com', password: 'testuser')
user_two = User.create!(email: 'user2@gmail.com', password: 'testuser')
user_three = User.create!(email: 'user3@gmail.com', password: 'testuser')

def create_search(current_user)
  Search.create(
    make: FFaker::Vehicle.make,
    model: FFaker::Vehicle.model,
    year_from: FFaker::Vehicle.year,
    year_to: FFaker::Vehicle.year,
    price_from: FFaker::Number.rand(10..1000) * 100,
    price_to: FFaker::Number.rand(10..1000) * 100,
    user_id: current_user.id
  )
end

50.times { create_search(user_one) }
50.times { create_search(user_two) }
50.times { create_search(user_three) }
