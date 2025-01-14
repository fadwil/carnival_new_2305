class Visitor
  attr_reader :name, :height, :preferences
  attr_accessor :spending_money

  def initialize(name, height, spending_money)
    @name = name
    @height = height
    @spending_money = spending_money.gsub(/[^\d.]/, '').to_i
    @preferences = []
  end

  def add_preference(preference)
    @preferences << preference
  end

  def tall_enough?(threshold)
    if @height >= threshold
      true
    else
      false
    end
  end
end