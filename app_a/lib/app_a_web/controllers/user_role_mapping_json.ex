defmodule AppAWeb.UserRoleMappingJSON do
  alias AppA.Admin.UserRoleMapping

  @doc """
  Renders a list of user_role_mappings.
  """
  def index(%{user_role_mappings: user_role_mappings}) do
    %{data: for(user_role_mapping <- user_role_mappings, do: data(user_role_mapping))}
  end

  @doc """
  Renders a single user_role_mapping.
  """
  def show(%{user_role_mapping: user_role_mapping}) do
    %{data: data(user_role_mapping)}
  end

  defp data(%UserRoleMapping{} = user_role_mapping) do
    %{
      id: user_role_mapping.id
    }
  end
end
