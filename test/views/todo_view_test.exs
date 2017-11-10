defmodule Todos.TodoViewTest do
  use TodosWeb.ConnCase, async: true
  # import Todos.Factory
  alias TodosWeb.TodoView

  test "render todo.json" do
    todo = insert(:todo)

    rendered_todo = TodoView.render("todo.json", %{todo: todo})

    assert rendered_todo == %{
      title: todo.title,
      description: todo.description,
      id: todo.id
    }
  end

  test "render todo bad title" do
    todo = insert(:todo)

    rendered_todo = TodoView.render("todo.json", %{todo: todo})

    refute rendered_todo == %{
      title: "bad title",
      description: todo.description,
      id: todo.id
    }
  end

  test "index.json" do
    todo = insert(:todo)

    rendered_todos = TodoView.render("index.json", %{todos: [todo]})
    
    assert rendered_todos == %{
      data: [TodoView.render("todo.json", %{todo: todo})]
    }
  end


  test "show.json" do
    todo = insert(:todo)

    rendered_todo = TodoView.render("show.json", %{todo: todo})

    assert rendered_todo == %{
      data: TodoView.render("todo.json", %{todo: todo})
    }
  end
end