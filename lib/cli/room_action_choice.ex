defmodule DungeonCrawl.CLI.RoomActionChoice do
  import DungeonCrawl.CLI.BaseCommands

  def start(%DungeonCrawl.Room{} = room) do
    info(room.description)

    action =
      room.actions
      |> display_options
      |> generate_question
      |> prompt
      |> parse_answer
      |> find_action_by_index(room.actions)

    if action do
      {room, action}
    else
      start(room)
    end
  end

  defp find_action_by_index(nil, _actions), do: nil

  defp find_action_by_index(index, actions) do
    Enum.at(actions, index)
  end
end
