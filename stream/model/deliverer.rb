require_relative 'subscription.rb'

class Deliverer
  attr_accessor :subscription

  attr_accessor :id, :subscriptions

  def initialize(id, subscriptions)
    @id = id
    @subscriptions = subscriptions
    @subscription = Subscription.new
  end

  def to_s
    "Your string representation of the object will be written here."
  end
end