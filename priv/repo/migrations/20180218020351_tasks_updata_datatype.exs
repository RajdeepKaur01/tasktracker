defmodule Tasktracker.Repo.Migrations.TasksUpdataDatatype do
  use Ecto.Migration

  def change do
    alter table(:tasks) do
      modify :worktime, :bigint, default: 0
    end
  end

end
