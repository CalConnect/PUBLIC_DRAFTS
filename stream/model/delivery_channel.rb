require_relative 'subscription.rb'

class DeliveryChannel
  attr_accessor :subscription

  attr_accessor :type, :id, :deliveryUri

  def initialize(type, id, deliveryUri)
    @type = type
    @id = id
    @deliveryUri = deliveryUri
    @subscription = Subscription.new
  end

  def to_s
    "Your string representation of the object will be written here."
  end
end