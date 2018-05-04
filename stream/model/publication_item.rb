require_relative 'publication.rb'

require_relative 'action_item.rb'

class PublicationItem < ActionItem
  attr_accessor :publication

  attr_accessor :data

  def initialize(data)
    @data = data
    @publication = Publication.new
  end

  def to_s
    "Your string representation of the object will be written here."
  end
end