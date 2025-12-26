defmodule Username do
  @german_letters %{
    ?ä => ~c"ae",
    ?ö => ~c"oe",
    ?ü => ~c"ue",
    ?ß => ~c"ss"
  }

  def sanitize([]), do: []
  def sanitize([letter | rest]) do
    cond do
      letter >= ?a and letter <= ?z -> [letter | sanitize(rest)]
      letter == ?_ -> [letter | sanitize(rest)]
      Map.has_key?(@german_letters, letter) -> @german_letters[letter] ++ sanitize(rest)
      true -> sanitize(rest)
    end
  end
end
