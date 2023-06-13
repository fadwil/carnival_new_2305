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
end