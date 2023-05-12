defmodule AppA.AdminFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `AppA.Admin` context.
  """

  @doc """
  Generate a role.
  """
  def role_fixture(attrs \\ %{}) do
    {:ok, role} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> AppA.Admin.create_role()

    role
  end

  @doc """
  Generate a user_role_mapping.
  """
  def user_role_mapping_fixture(attrs \\ %{}) do
    {:ok, user_role_mapping} =
      attrs
      |> Enum.into(%{

      })
      |> AppA.Admin.create_user_role_mapping()

    user_role_mapping
  end
end
