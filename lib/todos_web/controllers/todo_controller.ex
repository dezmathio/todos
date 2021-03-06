defmodule TodosWeb.TodoController do
  use TodosWeb, :controller

  alias Todos.Checklist
  alias Todos.Checklist.Todo

  action_fallback TodosWeb.FallbackController

  def index(conn, _params) do
    todos = Checklist.list_todos()
    render(conn, "index.json", todos: todos)
  end

  def create(conn, %{"todo" => todo_params}) do
    with {:ok, %Todo{} = todo} <- Checklist.create_todo(todo_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", todo_path(conn, :show, todo))
      |> render("show.json", todo: todo)
    end
  end

  def show(conn, %{"id" => id}) do
    todo = Checklist.get_todo!(id)
    render(conn, "show.json", todo: todo)
  end

  def update(conn, %{"id" => id, "todo" => todo_params}) do
    todo = Checklist.get_todo!(id)

    with {:ok, %Todo{} = todo} <- Checklist.update_todo(todo, todo_params) do
      render(conn, "show.json", todo: todo)
    end
  end

  def delete(conn, %{"id" => id}) do
    todo = Checklist.get_todo!(id)
    with {:ok, %Todo{}} <- Checklist.delete_todo(todo) do
      send_resp(conn, :no_content, "")
    end
  end
end
