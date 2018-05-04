require_relative 'serializer.rb'

class QLSerializer < Serializer
  attr_accessor :criteria

  def initialize(criteria)
    @criteria = criteria
  end

  def to_s
    "Your string representation of the object will be written here."
  end
end