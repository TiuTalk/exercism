defmodule BirdCount do
  def today([]), do: nil
  def today([today | _]), do: today

  def increment_day_count([]), do: [1]
  def increment_day_count([today | tail]), do: [today + 1 | tail]

  def has_day_without_birds?([]), do: false
  def has_day_without_birds?([0 | days]), do: true
  def has_day_without_birds?([_ | days]), do: has_day_without_birds?(days)

  def total([]), do: 0
  def total([count | days]), do: count + total(days)

  def busy_days([]), do: 0
  def busy_days([count | days]) when count >= 5, do: 1 + busy_days(days)
  def busy_days([_ | days]), do: busy_days(days)
end
