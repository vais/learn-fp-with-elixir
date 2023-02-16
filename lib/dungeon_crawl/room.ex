defmodule DungeonCrawl.Room do
  alias DungeonCrawl.Room

  import DungeonCrawl.Room.Action

  defstruct description: nil, actions: []

  def all do
    [
      %Room{
        description: "You've found a quiet place. Looks safe for a little nap.",
        actions: [rest(), forward()]
      }
    ]
  end
end
