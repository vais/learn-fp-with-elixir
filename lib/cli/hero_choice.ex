defmodule DungeonCrawl.CLI.HeroChoice do
  alias Mix.Shell.IO, as: Shell

  def start do
    Shell.cmd("clear")
    Shell.info("Start by choosing your hero:")

    heroes = DungeonCrawl.Heroes.all()

    heroes
    |> Enum.map(fn hero -> hero.name end)
    |> display_options
    |> generate_question
    |> Shell.prompt()
    |> parse_answer
    |> find_hero_by_index(heroes)
    |> confirm_hero
  end

  defp find_hero_by_index(nil, _heroes), do: nil

  defp find_hero_by_index(index, heroes) do
    Enum.at(heroes, index)
  end

  defp generate_question(options) do
    "What will it be? [#{Enum.join(1..length(options), ", ")}]"
  end

  defp parse_answer(answer) do
    case Integer.parse(answer) do
      {integer, _} -> integer - 1
      :error -> nil
    end
  end

  defp confirm_hero(nil), do: start()

  defp confirm_hero(hero) do
    Shell.cmd("clear")
    Shell.info("You have chosen #{hero.name}. #{hero.description}")
    if Shell.yes?("Confirm?"), do: hero, else: start()
  end

  defp display_options(options) do
    options
    |> Enum.with_index(1)
    |> Enum.each(fn {option, index} -> Shell.info("#{index} - #{option}") end)

    options
  end
end
