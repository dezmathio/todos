defmodule TodosWeb.Factory do
  use ExMachina.Ecto, repo: Todos.Repo

  def todo_factory do
    %Todos.Checklist.Todo{
      title: "Something I need to do",
      description: "List of steps I need to complete"
    }
  end
end