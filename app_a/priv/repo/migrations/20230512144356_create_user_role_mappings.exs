defmodule AppA.Repo.Migrations.CreateUserRoleMappings do
  use Ecto.Migration

  def change do
    create table(:user_role_mappings) do
      add :user_id, references(:users, on_delete: :nothing)
      add :role_id, references(:roles, on_delete: :nothing)

      timestamps()
    end

    create index(:user_role_mappings, [:user_id])
    create index(:user_role_mappings, [:role_id])
  end
end
