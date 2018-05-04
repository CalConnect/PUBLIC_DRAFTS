require_relative 'subscribed_item.rb'

class SerializedData
  attr_accessor :subscribed_item

  attr_accessor :type, :format, :data

  def initialize(type, format, data)
    @type = type
    @format = format
    @data = data
    @subscribed_item = SubscribedItem.new
  end

  def to_s
    "Your string representation of the object will be written here."
  end
end