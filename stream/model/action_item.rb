class ActionItem
  attr_accessor :id, :actor, :publication, :publishedAt, :itemType

  def initialize(id, actor, publication, publishedAt, itemType)
    @id = id
    @actor = actor
    @publication = publication
    @publishedAt = publishedAt
    @itemType = itemType
  end

  def to_s
    "Your string representation of the object will be written here."
  end
end