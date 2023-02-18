defmodule DungeonCrawl.Room do
  alias DungeonCrawl.{Room, Room.Action, Room.Triggers}

  defstruct description: nil,
            actions: [],
            trigger: nil

  @type t :: %Room{
          description: String.t(),
          actions: [Action.t()],
          trigger: any
        }

  import Action

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
