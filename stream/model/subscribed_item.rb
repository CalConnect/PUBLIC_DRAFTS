require_relative 'subscription.rb'
require_relative 'publication_item.rb'

require_relative 'action_item.rb'

class SubscribedItem < ActionItem
  attr_accessor :subscription, :publication_item

  attr_accessor :publicationItem, :subscription, :data

  def initialize(publicationItem, subscription, data)
    @publicationItem = publicationItem
    @subscription = subscription
    @data = data
    @subscription = Subscription.new
    @publication_item = PublicationItem.new
  end

  def to_s
    "Your string representation of the object will be written here."
  end
end