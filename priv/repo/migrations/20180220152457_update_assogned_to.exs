defmodule Tasktracker.Repo.Migrations.UpdateAssognedTo do
  use Ecto.Migration

  def change do
    drop table("tasks")

    create table(:tasks) do
      add :title, :string, null: false
      add :description, :text, null: false
      add :assigned_to, references(:users, on_delete: :nothing)
      add :worktime, :bigint, default: 0
      add :complete, :boolean, default: false, null: false
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
  end

    create index(:tasks, [:user_id])
  end
end
