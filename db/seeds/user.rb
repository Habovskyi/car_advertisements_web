User.create(email: 'user1@gmail.com', password: 'testuser')
User.create(email: 'user2@gmail.com', password: 'testuser')
User.create(email: 'user3@gmail.com', password: 'testuser')

def create_search(id)
  Search.create(
    make: FFaker::Vehicle.make,
    model: FFaker::Vehicle.model,
    year_from: FFaker::Vehicle.year,
    year_to: FFaker::Vehicle.year,
    price_from: FFaker::Number.rand(10..1000) * 100,
    price_to: FFaker::Number.rand(10..1000) * 100,
    user_id: id
  )
end

50.times { create_search(User.last.id - 2) }
50.times { create_search(User.last.id - 1) }
50.times { create_search(User.last.id) }
