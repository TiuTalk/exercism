defmodule LanguageList do
  def new(), do: []
  def add(list, language), do: [language | list]
  def remove([_ | list]), do: list

  def first([head | _]), do: head

  def count([]), do: 0
  def count([_ | list]), do: 1 + count(list)

  def functional_list?([]), do: false
  def functional_list?(["Elixir" | _]), do: true
  def functional_list?([_ | list]), do: functional_list?(list)
end
