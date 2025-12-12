defmodule LanguageList do
  def new(), do: []
  def add(list, language), do: [language | list]
  def remove([_ | list]), do: list
  def first([head | _]), do: head
  def count(list), do: Enum.count(list)
  def functional_list?(list), do: Enum.member?(list, "Elixir")
end
