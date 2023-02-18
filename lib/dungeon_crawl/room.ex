defmodule DungeonCrawl.Room do
  defstruct description: nil,
            actions: []

  alias DungeonCrawl.Room
  import Room.Action

  def all do
    [
      %Room{
        description: "You've found a quiet place. Looks safe for a little nap.",
        actions: [rest(), forward()]
      }
    ]
  end
end
