defmodule DungeonCrawl.Room.Triggers.Enemy do
  alias DungeonCrawl.{Enemies, Battle, Room.Trigger, Room.Action}
  alias Mix.Shell.IO, as: Shell

  @behaviour Trigger

  def run(hero, %Action{id: :forward}) do
    enemy = Enum.random(Enemies.all())

    Shell.info(enemy.description)
    Shell.info("The enemy #{enemy.name} wants to fight.")
    Shell.info("You were prepared and attck first.")

    {updated_hero, _enemy} = Battle.fight(hero, enemy)

    {updated_hero, :forward}
  end
end
