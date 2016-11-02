class MuncherHit
  attr_reader :recipe, :bookmark, :bought

  def initialize(recipe, bookmark, bought)
    @reciepe = recipe
    @bookmark = bookmark
    @bought = bought
  end
end
