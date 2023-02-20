defmodule DungeonCrawl.Character do
  alias DungeonCrawl.Character

  defstruct name: nil,
            description: nil,
            hit_points: 0,
            max_hit_points: 0,
            attack_description: nil,
            damage_range: nil

  @type t :: %Character{
          name: String.t(),
          description: String.t(),
          hit_points: non_neg_integer,
          max_hit_points: non_neg_integer,
          attack_description: String.t(),
          damage_range: Range.t()
        }

  defimpl String.Chars do
    def to_string(character), do: character.name
  end

  def take_damage(%Character{} = character, damage) do
    %{character | hit_points: max(0, character.hit_points - damage)}
  end

  def heal(%Character{} = character, healing_value) do
    %{character | hit_points: min(character.hit_points + healing_value, character.max_hit_points)}
  end

  def player_stats(%Character{} = character) do
    "Player Stats:\nHP: #{character.hit_points}/#{character.max_hit_points}"
  end
end
