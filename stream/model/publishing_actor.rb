require_relative 'publisher.rb'

class PublishingActor
  attr_accessor :publisher

  attr_accessor :id, :name, :publicKey

  def initialize(id, name, publicKey)
    @id = id
    @name = name
    @publicKey = publicKey
    @publisher = Publisher.new
  end

  def to_s
    "Your string representation of the object will be written here."
  end
end