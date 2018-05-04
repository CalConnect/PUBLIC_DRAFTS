require_relative 'subscription.rb'
require_relative 'subscription.rb'
require_relative 'publication.rb'
require_relative 'deliverer.rb'

class Subscriber
  attr_accessor :subscription, :subscription, :publication, :deliverer

  attr_accessor :id, :subscriptions

  def initialize(id, subscriptions)
    @id = id
    @subscriptions = subscriptions
    @subscription = Subscription.new
    @subscription = Subscription.new
    @publication = Publication.new
    @deliverer = Deliverer.new
  end

  def to_s
    "Your string representation of the object will be written here."
  end
end