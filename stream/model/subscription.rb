require_relative 'subscriber.rb'
require_relative 'subscriber.rb'
require_relative 'publisher.rb'
require_relative 'publication.rb'
require_relative 'publication.rb'
require_relative 'subscribed_item.rb'
require_relative 'publication.rb'
require_relative 'deliverer.rb'

class Subscription
  attr_accessor :subscriber, :subscriber, :publisher, :publication, :publication, :subscribed_item, :publication, :deliverer

  attr_accessor :id, :deliveryChannels, :deliveryFormat, :serializer, :items

  def initialize(id, deliveryChannels, deliveryFormat, serializer, items)
    @id = id
    @deliveryChannels = deliveryChannels
    @deliveryFormat = deliveryFormat
    @serializer = serializer
    @items = items
    @subscriber = Subscriber.new
    @subscriber = Subscriber.new
    @publisher = Publisher.new
    @publication = Publication.new
    @publication = Publication.new
    @subscribed_item = SubscribedItem.new
    @publication = Publication.new
    @deliverer = Deliverer.new
  end

  def to_s
    "Your string representation of the object will be written here."
  end
end