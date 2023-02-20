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
        description: "You can see the light of day... It looks like this could be the exit!",
        actions: [forward()],
        trigger: Triggers.Exit
      },
      %Room{
        description: "You can see an enemy blocking your path.",
        actions: [forward()],
        trigger: Triggers.Enemy
      }
    ]
  end
end
