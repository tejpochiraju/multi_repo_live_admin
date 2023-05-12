defmodule AppB.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `AppB.Accounts` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        email: "some email",
        name: "some name"
      })
      |> AppB.Accounts.create_user()

    user
  end
end
