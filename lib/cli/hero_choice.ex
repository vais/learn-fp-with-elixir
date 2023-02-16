defmodule DungeonCrawl.CLI.HeroChoice do
  import DungeonCrawl.CLI.BaseCommands

  def start do
    clear()
    info("Start by choosing your hero:")

    heroes = DungeonCrawl.Heroes.all()

    heroes
    |> Enum.map(fn hero -> hero.name end)
    |> display_options
    |> generate_question
    |> prompt
    |> parse_answer
    |> find_hero_by_index(heroes)
    |> confirm_hero
  end

  defp find_hero_by_index(nil, _heroes), do: nil

  defp find_hero_by_index(index, heroes) do
    Enum.at(heroes, index)
  end

  defp confirm_hero(nil), do: start()

  defp confirm_hero(hero) do
    clear()
    info("You have chosen #{hero.name}. #{hero.description}")

    if yes?("Confirm?") do
      hero
    else
      start()
    end
  end
end
