defmodule DungeonCrawl.CLI.Main do
  import DungeonCrawl.CLI.BaseCommands

  def start_game do
    welcome_message()
    hero_choice()
    clear()
    crawl(DungeonCrawl.Room.all())
  end

  defp welcome_message do
    clear()
    info("== Dungeon Crawl ===")
    info("You awake in a dungeon full of monsters.")
    info("You need to survive and find the exit.")
    prompt("Press Enter to continue...")
    clear()
  end

  defp hero_choice do
    DungeonCrawl.CLI.HeroChoice.start()
  end

  defp crawl(rooms) do
    info("You're ready to move forward to the next room.")
    prompt("Press Enter to continue...")

    rooms
    |> Enum.random()
    |> DungeonCrawl.CLI.RoomActionChoice.start()
    |> IO.inspect()
  end
end
