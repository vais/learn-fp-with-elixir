defmodule DungeonCrawl.CLI.RoomActionChoice do
  import DungeonCrawl.CLI.BaseCommands

  def start(room) do
    clear()
    info(room.description)

    action =
      room.actions
      |> Enum.map(fn action -> action.label end)
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
