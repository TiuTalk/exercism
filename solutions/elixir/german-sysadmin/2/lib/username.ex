defmodule Username do
  @german_letters %{
    ?ä => ~c"ae",
    ?ö => ~c"oe",
    ?ü => ~c"ue",
    ?ß => ~c"ss"
  }

  def sanitize([]), do: []
  def sanitize([letter | rest]) when (letter in ?a..?z or letter == ?_), do: [letter | sanitize(rest)]
  def sanitize([letter | rest]) do
    case @german_letters[letter] do
      nil -> sanitize(rest)
      letter -> letter ++ sanitize(rest)
    end
  end
end
