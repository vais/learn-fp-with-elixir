defmodule DungeonCrawl.Room do
  defstruct description: nil,
            actions: [],
            trigger: nil

  alias DungeonCrawl.Room
  alias DungeonCrawl.Room.Triggers

  import Room.Action

  def all do
    [
      %Room{
        description: "You can see the light of day... You've found the exit!",
        actions: [forward()],
        trigger: Triggers.Exit
      }
    ]
  end
end
