defmodule DungeonCrawl.CLI.Main do
  import DungeonCrawl.CLI.BaseCommands

  def start_game do
    welcome_message()

    hero_choice()
    |> crawl(DungeonCrawl.Room.all())
  end

  defp welcome_message do
    clear()
    info("=== Dungeon Crawl ===")
    info("You awake in a dungeon full of monsters.")
    info("You need to survive and find the exit.")
    prompt("Press Enter to continue...")
    clear()
  end

  defp hero_choice do
    DungeonCrawl.CLI.HeroChoice.start()
  end

  defp crawl(hero, rooms) do
    info("You keep moving forward to the next room.")
    prompt("Press Enter to continue...")
    clear()

    rooms
    |> Enum.random()
    |> DungeonCrawl.CLI.RoomActionChoice.start()
    |> trigger_action(hero)
    |> handle_action_result
  end

  defp trigger_action({room, action}, hero) do
    room.trigger.run(hero, action)
  end

  defp handle_action_result({_hero, :exit}) do
    info("You've found the exit. You've won the game!")
  end

  defp handle_action_result({hero, _action}) do
    crawl(hero, DungeonCrawl.Room.all())
  end
end
