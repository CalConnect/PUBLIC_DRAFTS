require_relative 'subscription.rb'
require_relative 'publication.rb'
require_relative 'publication.rb'

class Publisher
  attr_accessor :subscription, :publication, :publication

  attr_accessor :id, :publicKey, :actors, :name

  def initialize(id, publicKey, actors, name)
    @id = id
    @publicKey = publicKey
    @actors = actors
    @name = name
    @subscription = Subscription.new
    @publication = Publication.new
    @publication = Publication.new
  end

  def to_s
    "Your string representation of the object will be written here."
  end
end