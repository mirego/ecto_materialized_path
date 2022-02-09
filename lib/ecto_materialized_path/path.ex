defmodule EctoMaterializedPath.Path do
  @behaviour Ecto.Type

  @moduledoc """
  Right now it's implemented absolutely the same as { :array, :integer }
  But things can change later
  """

  def cast(list) when is_list(list) do
    path_is_correct? = Enum.all?(list, fn(path_id) -> is_integer(path_id) end)

    if path_is_correct? do
      { :ok, list }
    else
      :error
    end
  end
  def cast(_), do: :error

  def dump(value), do: { :ok, value }

  def load(value), do: { :ok, value }

  def type, do: EctoMaterializedPath.Path

  def equal?(term1, term2), do: term1 == term2

  def embed_as(_), do: :self
end
