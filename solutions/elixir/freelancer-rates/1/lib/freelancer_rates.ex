defmodule FreelancerRates do
  def daily_rate(hourly_rate), do: hourly_rate * 8.0

  def apply_discount(before_discount, discount), do: before_discount * (1.0 - (discount / 100.0))

  def monthly_rate(hourly_rate, discount) do
    daily_rate(hourly_rate)
    |> Kernel.*(22)
    |> apply_discount(discount)
    |> Kernel.ceil
  end

  def days_in_budget(budget, hourly_rate, discount) do
    rate = hourly_rate
      |> daily_rate()
      |> apply_discount(discount)

    (budget / rate) |> Float.floor(1)
  end
end
