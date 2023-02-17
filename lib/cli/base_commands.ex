defmodule DungeonCrawl.CLI.BaseCommands do
  alias Mix.Shell.IO, as: Shell

  def clear(), do: Shell.cmd("clear")
  def info(message), do: Shell.info(message)
  def prompt(message), do: Shell.prompt(message)
  def yes?(message), do: Shell.yes?(message)

  def display_options(options) do
    options
    |> Enum.with_index(1)
    |> Enum.each(fn {option, index} ->
      info("#{index} - #{option}")
    end)

    options
  end

  def generate_question(options) do
    "What will it be? [#{Enum.join(1..length(options), ", ")}]"
  end

  def parse_answer(answer) do
    case Integer.parse(answer) do
      {integer, _} -> integer - 1
      :error -> nil
    end
  end
end
