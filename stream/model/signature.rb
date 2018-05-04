class Signature
  attr_accessor :publicKey, :value, :signParty

  def initialize(publicKey, value, signParty)
    @publicKey = publicKey
    @value = value
    @signParty = signParty
  end

  def to_s
    "Your string representation of the object will be written here."
  end
end