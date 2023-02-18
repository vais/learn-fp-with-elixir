defmodule DungeonCrawl.Room.Action do
  alias DungeonCrawl.Room.Action

  defstruct id: nil,
            label: nil

  @type t :: %Action{
          id: atom,
          label: String.t()
        }

  def rest, do: %Action{id: :rest, label: "Take a better look and rest"}
  def forward, do: %Action{id: :forward, label: "Move forward"}
  def search, do: %Action{id: :search, label: "Search the room"}

  defimpl String.Chars do
    def to_string(action), do: action.label
  end
end
