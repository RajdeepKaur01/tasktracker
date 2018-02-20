defmodule Tasktracker.Tracker.Task do
  use Ecto.Schema
  import Ecto.Changeset
  alias Tasktracker.Tracker.Task


  schema "tasks" do
    #field :assigned_to, :id
    field :complete, :boolean, default: false
    field :description, :string
    field :title, :string
    field :worktime, :integer, default: 0
  #  field :user_id, :id
    belongs_to :user, Tasktracker.Accounts.User, foreign_key: :user_id
    belongs_to :assigned_user, Tasktracker.Accounts.User, foreign_key: :assigned_to
    timestamps()
  end

  @doc false
  def changeset(%Task{} = task, attrs) do
    task
    |> cast(attrs, [:user_id, :title, :description, :assigned_to, :worktime, :complete])
    |> validate_required([:user_id,:title, :description, :assigned_to, :worktime, :complete])
    |> foreign_key_constraint(:user_id)
    |> foreign_key_constraint(:assigned_to)

  end
end
