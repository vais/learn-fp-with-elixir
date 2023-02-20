defmodule DungeonCrawl.Battle do
  alias Mix.Shell.IO, as: Shell

  def fight(
        attacker = %{hit_points: hit_points_a},
        attacked = %{hit_points: hit_points_b}
      )
      when hit_points_a == 0 or hit_points_b == 0 do
    {attacker, attacked}
  end

  def fight(attacker, attacked) do
    attacked_after_damage = attack(attacker, attacked)
    attacker_after_damage = attack(attacked_after_damage, attacker)
    fight(attacker_after_damage, attacked_after_damage)
  end

  defp attack(_attacker = %{hit_points: 0}, attacked) do
    attacked
  end

  defp attack(attacker, attacked) do
    damage = Enum.random(attacker.damage_range)
    attacked_after_damage = DungeonCrawl.Character.take_damage(attacked, damage)

    attacker
    |> attacker_message(damage)
    |> Shell.info()

    attacked_after_damage
    |> attacked_message(damage)
    |> Shell.info()

    attacked_after_damage
  end

  defp attacker_message(attacker = %{name: "You"}, damage) do
    "You attack with #{attacker.attack_description} and deal #{damage} damage."
  end

  defp attacker_message(attacker, damage) do
    "#{attacker.name} attacks with #{attacker.attack_description} and deals #{damage} damage."
  end

  defp attacked_message(attacked = %{name: "You"}, damage) do
    "You receive #{damage} damage. You have #{attacked.hit_points} HP left."
  end

  defp attacked_message(attacked, damage) do
    "#{attacked.name} receives #{damage}. #{attacked.name} has #{attacked.hit_points} HP left."
  end
end
