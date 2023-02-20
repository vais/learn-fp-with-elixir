defmodule DungeonCrawl.CLI.Main do
  import DungeonCrawl.CLI.BaseCommands

  def start_game do
    clear()
    info("=== Dungeon Crawl ===")
    info("You awake in a dungeon full of monsters.")
    info("You need to survive and find the exit.")
    prompt("Press Enter to continue...")
    clear()

    hero_choice()
    |> crawl(DungeonCrawl.Room.all())
  end

  defp hero_choice do
    hero = DungeonCrawl.CLI.HeroChoice.start()
    %{hero | name: "You"}
  end

  defp crawl(%{hit_points: 0}, _rooms) do
    info("Unfortunately your wounds are too many to keep waling...")
    info("You fall on the floor without strength to carry on...")
    info("GAME OVER.")
  end

  defp crawl(hero, rooms) do
    info("You keep moving forward to the next room.")
    prompt("Press Enter to continue...")
    clear()

    info(DungeonCrawl.Character.player_stats(hero))

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
    info("You've found the exit! YOU WON THE GAME!")
  end

  defp handle_action_result({hero, _action}) do
    crawl(hero, DungeonCrawl.Room.all())
  end
end
