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
end
