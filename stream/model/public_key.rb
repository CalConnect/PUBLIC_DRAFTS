class PublicKey
  attr_accessor :type, :value

  def initialize(type, value)
    @type = type
    @value = value
  end

  def to_s
    "Your string representation of the object will be written here."
  end
end