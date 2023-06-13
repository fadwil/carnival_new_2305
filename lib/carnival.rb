class Carnival 
  attr_reader :duration, :rides

  def initialize(duration, rides)
    @duration = duration
    @rides = rides
  end

  def most_popular_ride
    rides.max_by do |ride|
      ride.rider_log.values.sum
    end
  end

  def most_profitable_ride
    rides.max_by do |ride|
      ride.total_revenue
    end
  end

  def total_revenue
    rides.sum do |ride|
      ride.total_revenue
    end
  end
end