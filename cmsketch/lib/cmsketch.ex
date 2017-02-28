defmodule Cmsketch do
  @moduledoc """
  Documentation for Cmsketch.
  """

  @doc """
  Hello world.

  ## Examples
  """
  def create(n_tables, columns) do
    for _ <- :lists.seq(1, n_tables), into: [] do
      seed = :rand.uniform(100000)
      %{
        'hash' => fn x -> rem(Murmur.hash_x86_32(x, seed), columns)  end,
        'array' => Enum.map(:lists.seq(1, columns), fn _ -> 0 end)
      }
    end
  end

  def query(state, term) do
    Enum.reduce(state, -1,
                fn ds, acc ->
                  position = ds['hash'].(term)
                  value = Enum.at(ds['array'], position)
                  if acc == -1 do
                    value
                  else
                    min(acc, value)
                  end
                end)
  end

  def add(state, term) do
    Enum.map(state,
             fn ds ->
               position = ds['hash'].(term)
               Map.put(ds, 'array', List.update_at(ds['array'], position, &(&1 + 1)))
             end)
  end
end
