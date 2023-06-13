require './lib/visitor'
require './lib/ride'
require './lib/carnival'

RSpec.describe Carnival do
  it 'exists and has readable attributes' do
    ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
    ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
    ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })

    carnival = Carnival.new(7, [ride1, ride2, ride3])

    expect(carnival).to be_a(Carnival)
    expect(carnival.duration).to eq(7)
    expect(carnival.rides).to eq([ride1, ride2, ride3])
  end

  it 'has a most popular ride' do
    ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
    ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
    ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })

    carnival = Carnival.new(7, [ride1, ride2, ride3])

    visitor1 = Visitor.new('Bruce', 54, '$10')
    visitor2 = Visitor.new('Tucker', 36, '$5')
    visitor3 = Visitor.new('Penny', 64, '$15')

    visitor1.add_preference(:gentle)
    visitor2.add_preference(:gentle)
    visitor2.add_preference(:thrilling)
    visitor3.add_preference(:thrilling)
    visitor3.add_preference(:gentle)


    ride1.board_rider(visitor1)
    ride1.board_rider(visitor2)
    ride1.board_rider(visitor1)
    ride1.board_rider(visitor3)

    ride3.board_rider(visitor1)
    ride3.board_rider(visitor2)
    ride3.board_rider(visitor3)

    expect(carnival.most_popular_ride).to eq(ride1)
  end

  it 'has a most profitable ride' do
    ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
    ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
    ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })

    carnival = Carnival.new(7, [ride1, ride2, ride3])

    visitor1 = Visitor.new('Bruce', 54, '$50')
    visitor2 = Visitor.new('Tucker', 36, '$30')
    visitor3 = Visitor.new('Penny', 64, '$80')

    visitor1.add_preference(:gentle)
    visitor2.add_preference(:gentle)
    visitor2.add_preference(:thrilling)
    visitor3.add_preference(:thrilling)
    visitor3.add_preference(:gentle)

    ride1.board_rider(visitor1)
    ride1.board_rider(visitor2)
    ride1.board_rider(visitor1)
    ride1.board_rider(visitor3)

    ride2.board_rider(visitor2)
    ride2.board_rider(visitor1)
    ride2.board_rider(visitor3)
    ride2.board_rider(visitor2)

    ride3.board_rider(visitor1)
    ride3.board_rider(visitor2)
    ride3.board_rider(visitor3)

    expect(carnival.most_profitable_ride).to eq(ride2)
  end
end