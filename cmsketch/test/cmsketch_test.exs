defmodule CmsketchTest do
  use ExUnit.Case
  doctest Cmsketch

  setup_all do
    state =  Cmsketch.create(3, 5)
    {:ok, state: state}
  end

  test "create data structure" do
    assert [
      %{'hash' => _, 'array' => [0, 0, 0, 0, 0]},
      %{'hash' => _, 'array' => [0, 0, 0, 0, 0]},
      %{'hash' => _, 'array' => [0, 0, 0, 0, 0]},
    ] = Cmsketch.create(3, 5)
  end

  test "query before adding anything", %{state: state} do
    assert Cmsketch.query(state, "nandaja") == 0
    assert Cmsketch.query(state, "elias") == 0
  end

  test "add elements", %{state: state} do
    state = Cmsketch.add(state, "nandaja")
    state = Cmsketch.add(state, "nandaja")
    assert Cmsketch.query(state, "nandaja") == 2
    state = Cmsketch.add(state, "elias")
    assert Cmsketch.query(state, "nandaja") == 2
    assert Cmsketch.query(state, "elias") == 1
    IO.inspect state
  end
end
