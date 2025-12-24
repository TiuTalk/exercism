defmodule Darts do
  @type position :: {number, number}

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position) :: integer
  def score({x, y}) do
    case distance({0, 0}, {x, y}) do
      distance when distance <= 1 -> 10
      distance when distance <= 5 -> 5
      distance when distance <= 10 -> 1
      _ -> 0
    end
  end

  defp distance({x1, y1}, {x2, y2}) do
    :math.sqrt(:math.pow(x2 - x1, 2) + :math.pow(y2 - y1, 2))
  end
end
