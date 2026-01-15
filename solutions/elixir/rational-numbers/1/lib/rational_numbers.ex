defmodule RationalNumbers do
  @type rational :: {integer, integer}

  @doc """
  Add two rational numbers
  """

  @spec add(a :: rational, b :: rational) :: rational
  def add({a1, b1}, {a2, b2}), do: {(a1 * b2 + a2 * b1), (b1 * b2)} |> reduce

  @doc """
  Subtract two rational numbers
  """
  @spec subtract(a :: rational, b :: rational) :: rational
  def subtract({a1, b1}, {a2, b2}), do: {(a1 * b2 - a2 * b1), (b1 * b2)} |> reduce

  @doc """
  Multiply two rational numbers
  """
  @spec multiply(a :: rational, b :: rational) :: rational
  def multiply({a1, b1}, {a2, b2}), do: {(a1 * a2), (b1 * b2)} |> reduce

  @doc """
  Divide two rational numbers
  """
  @spec divide_by(num :: rational, den :: rational) :: rational
  def divide_by({a1, b1}, {a2, b2}), do: {(a1 * b2), (a2 * b1)} |> reduce

  @doc """
  Absolute value of a rational number
  """
  @spec abs(a :: rational) :: rational
  def abs({a, b}), do: {Kernel.abs(a), Kernel.abs(b)} |> reduce

  @doc """
  Exponentiation of a rational number by an integer
  """
  @spec pow_rational(a :: rational, n :: integer) :: rational
  def pow_rational({a, b}, n) when n < 0, do: pow_rational({b, a}, Kernel.abs(n))
  def pow_rational({a, b}, n), do: {a ** n, b ** n} |> reduce

  @doc """
  Exponentiation of a real number by a rational number
  """
  @spec pow_real(x :: integer, n :: rational) :: float
  def pow_real(x, {a, b}), do: (x ** a) ** (1 / b)

  # Exponentiation of a real number x to a rational number r = a/b is x^(a/b) = root(x^a, b), where root(p, q) is the qth root of p.

  @doc """
  Reduce a rational number to its lowest terms
  """
  @spec reduce(a :: rational) :: rational
  def reduce({a, b}) do
    gcd = Integer.gcd(a, b)
    numerator = div(a, gcd)
    denominator = div(b, gcd)

    if denominator >= 0 do
      {numerator, denominator}
    else
      {-numerator, -denominator}
    end
  end
end
