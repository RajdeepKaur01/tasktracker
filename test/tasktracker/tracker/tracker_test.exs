defmodule Tasktracker.TrackerTest do
  use Tasktracker.DataCase

  alias Tasktracker.Tracker

  describe "tasks" do
    alias Tasktracker.Tracker.Task

    @valid_attrs %{complete: true, description: "some description", title: "some title", worktime: "120.5"}
    @update_attrs %{complete: false, description: "some updated description", title: "some updated title", worktime: "456.7"}
    @invalid_attrs %{complete: nil, description: nil, title: nil, worktime: nil}

    def task_fixture(attrs \\ %{}) do
      {:ok, task} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Tracker.create_task()

      task
    end

    test "list_tasks/0 returns all tasks" do
      task = task_fixture()
      assert Tracker.list_tasks() == [task]
    end

    test "get_task!/1 returns the task with given id" do
      task = task_fixture()
      assert Tracker.get_task!(task.id) == task
    end

    test "create_task/1 with valid data creates a task" do
      assert {:ok, %Task{} = task} = Tracker.create_task(@valid_attrs)
      assert task.complete == true
      assert task.description == "some description"
      assert task.title == "some title"
      assert task.worktime == Decimal.new("120.5")
    end

    test "create_task/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tracker.create_task(@invalid_attrs)
    end

    test "update_task/2 with valid data updates the task" do
      task = task_fixture()
      assert {:ok, task} = Tracker.update_task(task, @update_attrs)
      assert %Task{} = task
      assert task.complete == false
      assert task.description == "some updated description"
      assert task.title == "some updated title"
      assert task.worktime == Decimal.new("456.7")
    end

    test "update_task/2 with invalid data returns error changeset" do
      task = task_fixture()
      assert {:error, %Ecto.Changeset{}} = Tracker.update_task(task, @invalid_attrs)
      assert task == Tracker.get_task!(task.id)
    end

    test "delete_task/1 deletes the task" do
      task = task_fixture()
      assert {:ok, %Task{}} = Tracker.delete_task(task)
      assert_raise Ecto.NoResultsError, fn -> Tracker.get_task!(task.id) end
    end

    test "change_task/1 returns a task changeset" do
      task = task_fixture()
      assert %Ecto.Changeset{} = Tracker.change_task(task)
    end
  end

  describe "tasks" do
    alias Tasktracker.Tracker.Task

    @valid_attrs %{assigned_to: "some assigned_to", complete: true, description: "some description", title: "some title", worktime: "120.5"}
    @update_attrs %{assigned_to: "some updated assigned_to", complete: false, description: "some updated description", title: "some updated title", worktime: "456.7"}
    @invalid_attrs %{assigned_to: nil, complete: nil, description: nil, title: nil, worktime: nil}

    def task_fixture(attrs \\ %{}) do
      {:ok, task} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Tracker.create_task()

      task
    end

    test "list_tasks/0 returns all tasks" do
      task = task_fixture()
      assert Tracker.list_tasks() == [task]
    end

    test "get_task!/1 returns the task with given id" do
      task = task_fixture()
      assert Tracker.get_task!(task.id) == task
    end

    test "create_task/1 with valid data creates a task" do
      assert {:ok, %Task{} = task} = Tracker.create_task(@valid_attrs)
      assert task.assigned_to == "some assigned_to"
      assert task.complete == true
      assert task.description == "some description"
      assert task.title == "some title"
      assert task.worktime == Decimal.new("120.5")
    end

    test "create_task/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tracker.create_task(@invalid_attrs)
    end

    test "update_task/2 with valid data updates the task" do
      task = task_fixture()
      assert {:ok, task} = Tracker.update_task(task, @update_attrs)
      assert %Task{} = task
      assert task.assigned_to == "some updated assigned_to"
      assert task.complete == false
      assert task.description == "some updated description"
      assert task.title == "some updated title"
      assert task.worktime == Decimal.new("456.7")
    end

    test "update_task/2 with invalid data returns error changeset" do
      task = task_fixture()
      assert {:error, %Ecto.Changeset{}} = Tracker.update_task(task, @invalid_attrs)
      assert task == Tracker.get_task!(task.id)
    end

    test "delete_task/1 deletes the task" do
      task = task_fixture()
      assert {:ok, %Task{}} = Tracker.delete_task(task)
      assert_raise Ecto.NoResultsError, fn -> Tracker.get_task!(task.id) end
    end

    test "change_task/1 returns a task changeset" do
      task = task_fixture()
      assert %Ecto.Changeset{} = Tracker.change_task(task)
    end
  end
end
