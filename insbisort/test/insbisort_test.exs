defmodule InsbisortTest do
  use ExUnit.Case
  doctest Insbisort

  test "binary search for empty list" do
    assert Insbisort.binary_search({}, 4) == 0
  end

  test "binary search for list of size one" do
    assert Insbisort.binary_search({1}, 4, 0, 1) == 1
    assert Insbisort.binary_search({4}, 1, 0, 1) == 0
  end

  test "binary search for lesser than needle" do
    assert Insbisort.binary_search({1, 4, 8, 9}, 5) == 2
  end

  test "binary search for bigger than needle" do
    assert Insbisort.binary_search({1, 4, 8, 9}, 8) == 3
  end

  test "binary search for very big element" do
    assert Insbisort.binary_search({1, 4, 8, 9}, 15) == 4
  end

  test "binary search for very small element" do
    assert Insbisort.binary_search({3, 4, 8, 9}, 1) == 0
  end
end
