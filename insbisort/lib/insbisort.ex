defmodule Insbisort do
  @moduledoc """
  Documentation for Insbisort.
  """

  def binary_search({}, _needle, _, _), do: 0
  def binary_search({  one  }, needle, _, _) do
    case one > needle do
      true -> 0
      false -> 1
    end
  end
  def binary_search(_array, _needle, start, stop) when start == stop do
    case start do
      0 -> 0
      _ -> stop + 1
    end
  end
  def binary_search(_array, _needle, start, stop) when start > stop do
    start
  end
  def binary_search(array, needle, start, stop) do
    mid = div(start + stop, 2)
    pivot = elem(array, mid)
    cond do
      pivot == needle -> mid + 1
      pivot > needle -> binary_search(array, needle, start, mid - 1)
      pivot < needle -> binary_search(array, needle, mid + 1, stop)
    end
  end
  def binary_search(array, needle) do
    binary_search(array, needle, 0, tuple_size(array) - 1)
  end
end
