defmodule DungeonCrawl.CLI.Main do
  import DungeonCrawl.CLI.BaseCommands

  def start_game do
    welcome_message()
    prompt("Press Enter to continue...")
    hero_choice()
  end

  defp welcome_message do
    clear()
    info("== Dungeon Crawl ===")
    info("You awake in a dungeon full of monsters.")
    info("You need to survive and find the exit.")
  end

  defp hero_choice do
    DungeonCrawl.CLI.HeroChoice.start()
  end
end
