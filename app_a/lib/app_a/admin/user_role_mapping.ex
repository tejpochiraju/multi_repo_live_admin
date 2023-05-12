defmodule AppA.Admin.UserRoleMapping do
  use Ecto.Schema
  import Ecto.Changeset

  schema "user_role_mappings" do

    field :user_id, :id
    field :role_id, :id

    timestamps()
  end

  @doc false
  def changeset(user_role_mapping, attrs) do
    user_role_mapping
    |> cast(attrs, [])
    |> validate_required([])
  end
end
