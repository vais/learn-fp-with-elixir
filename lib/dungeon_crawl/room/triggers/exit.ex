defmodule DungeonCrawl.Room.Triggers.Exit do
  @behaviour DungeonCrawl.Room.Trigger

  def run(character, _action) do
    {character, :exit}
  end
end
