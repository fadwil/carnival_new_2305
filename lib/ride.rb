class Ride
  attr_reader :name, :min_height, :admission_fee, :excitement, :rider_log

  def initialize(ride_info)
    @name = ride_info[:name]
    @min_height = ride_info[:min_height]
    @admission_fee = ride_info[:admission_fee]
    @excitement = ride_info[:excitement]
    @rider_log = {}
  end

  def board_rider(visitor)
    if visitor.height >= @min_height && visitor.preferences.include?(@excitement)
      @rider_log[visitor] = 0 unless @rider_log.key?(visitor)
      @rider_log[visitor] += 1
      visitor.spending_money -= @admission_fee
    end
  end
end