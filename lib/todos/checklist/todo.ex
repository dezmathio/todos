defmodule Todos.Checklist.Todo do
  use Ecto.Schema
  import Ecto.Changeset
  alias Todos.Checklist.Todo


  schema "todos" do
    field :description, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(%Todo{} = todo, attrs) do
    todo
    |> cast(attrs, [:title, :description])
    |> validate_required([:title, :description])
  end
end
