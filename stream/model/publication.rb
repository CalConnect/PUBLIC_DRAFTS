require_relative 'publisher.rb'
require_relative 'subscription.rb'
require_relative 'subscription.rb'
require_relative 'subscriber.rb'
require_relative 'publication.rb'
require_relative 'publication.rb'
require_relative 'publisher.rb'
require_relative 'publication_item.rb'

class Publication
  attr_accessor :publisher, :subscription, :subscription, :subscriber, :publication, :publication, :publisher, :publication_item

  attr_accessor :id, :description, :publishedAt, :subscriptions, :items, :acceptedFormats

  def initialize(id, description, publishedAt, subscriptions, items, acceptedFormats)
    @id = id
    @description = description
    @publishedAt = publishedAt
    @subscriptions = subscriptions
    @items = items
    @acceptedFormats = acceptedFormats
    @publisher = Publisher.new
    @subscription = Subscription.new
    @subscription = Subscription.new
    @subscriber = Subscriber.new
    @publication = Publication.new
    @publication = Publication.new
    @publisher = Publisher.new
    @publication_item = PublicationItem.new
  end

  def permitToSubscribe
    # TODO(person name): Implement this method here.
  end
  def to_s
    "Your string representation of the object will be written here."
  end
end