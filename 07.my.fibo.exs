defmodule Fib do
  @moduledoc """
  Fibonacci Sequence function.
  Please note, I wrote this purely from memory --
  I mean, I'm sure there's a more concise way to build this algorithm. :-)
  """

  @seed [0, 1]

  # named functions can have different arities, whereas anonymous functions cannot
  # also, anonymous functions cannot call themselves recursively :-(

  def fib(n) when n < 2 do
    Enum.take @seed, n
  end

  def fib(n) when n >= 2 do
    fib(@seed, n - 2)
  end

  #def fib(acc, 0), do: acc
  def fib(acc, 0) do
    acc
  end

  def fib(acc, n) do
    fib(acc ++ [Enum.at(acc, -2) + Enum.at(acc, -1)], n - 1)
  end
end

defmodule Fib2 do
  @moduledoc """
  Fibonacci Sequence function.
  This is my attempt to be more efficient by building the list
  backwards (and then reversing at the end).
  """

  @seed [1, 0]

  def fib2(n) when n < 2 do
    Enum.reverse(@seed) |> Enum.take(n)
  end

  def fib2(n) when n >= 2 do
    fib2(@seed, n - 2)
  end

  def fib2(acc, 0), do: Enum.reverse(acc)

  def fib2([first, second | tail], n) do
    fib2([first + second] ++ [first, second] ++ tail, n - 1)
  end

end

defmodule MyFib do
  @moduledoc """
    Fibonacci Sequence function.
  """

  @seed [0, 1]

  def fib(n) when n < 2 do
    Enum.take(@seed, n+1)
  end

  def fib(n) when n >= 2 do
    [fst, snd | _] = Enum.reverse(fib(n-1))

    fib(n-1) ++ [fst + snd] 
  end
end

for x <- (Enum.to_list 1..10) do
  IO.puts("##############################")
  Enum.each(MyFib.fib(x), &IO.puts(&1))
  IO.puts("##############################")
end
