defmodule AppA.Admin do
  @moduledoc """
  The Admin context.
  """

  import Ecto.Query, warn: false
  alias AppA.Repo

  alias AppA.Admin.Role

  @doc """
  Returns the list of roles.

  ## Examples

      iex> list_roles()
      [%Role{}, ...]

  """
  def list_roles do
    Repo.all(Role)
  end

  @doc """
  Gets a single role.

  Raises `Ecto.NoResultsError` if the Role does not exist.

  ## Examples

      iex> get_role!(123)
      %Role{}

      iex> get_role!(456)
      ** (Ecto.NoResultsError)

  """
  def get_role!(id), do: Repo.get!(Role, id)

  @doc """
  Creates a role.

  ## Examples

      iex> create_role(%{field: value})
      {:ok, %Role{}}

      iex> create_role(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_role(attrs \\ %{}) do
    %Role{}
    |> Role.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a role.

  ## Examples

      iex> update_role(role, %{field: new_value})
      {:ok, %Role{}}

      iex> update_role(role, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_role(%Role{} = role, attrs) do
    role
    |> Role.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a role.

  ## Examples

      iex> delete_role(role)
      {:ok, %Role{}}

      iex> delete_role(role)
      {:error, %Ecto.Changeset{}}

  """
  def delete_role(%Role{} = role) do
    Repo.delete(role)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking role changes.

  ## Examples

      iex> change_role(role)
      %Ecto.Changeset{data: %Role{}}

  """
  def change_role(%Role{} = role, attrs \\ %{}) do
    Role.changeset(role, attrs)
  end

  alias AppA.Admin.UserRoleMapping

  @doc """
  Returns the list of user_role_mappings.

  ## Examples

      iex> list_user_role_mappings()
      [%UserRoleMapping{}, ...]

  """
  def list_user_role_mappings do
    Repo.all(UserRoleMapping)
  end

  @doc """
  Gets a single user_role_mapping.

  Raises `Ecto.NoResultsError` if the User role mapping does not exist.

  ## Examples

      iex> get_user_role_mapping!(123)
      %UserRoleMapping{}

      iex> get_user_role_mapping!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user_role_mapping!(id), do: Repo.get!(UserRoleMapping, id)

  @doc """
  Creates a user_role_mapping.

  ## Examples

      iex> create_user_role_mapping(%{field: value})
      {:ok, %UserRoleMapping{}}

      iex> create_user_role_mapping(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user_role_mapping(attrs \\ %{}) do
    %UserRoleMapping{}
    |> UserRoleMapping.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user_role_mapping.

  ## Examples

      iex> update_user_role_mapping(user_role_mapping, %{field: new_value})
      {:ok, %UserRoleMapping{}}

      iex> update_user_role_mapping(user_role_mapping, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user_role_mapping(%UserRoleMapping{} = user_role_mapping, attrs) do
    user_role_mapping
    |> UserRoleMapping.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a user_role_mapping.

  ## Examples

      iex> delete_user_role_mapping(user_role_mapping)
      {:ok, %UserRoleMapping{}}

      iex> delete_user_role_mapping(user_role_mapping)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user_role_mapping(%UserRoleMapping{} = user_role_mapping) do
    Repo.delete(user_role_mapping)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user_role_mapping changes.

  ## Examples

      iex> change_user_role_mapping(user_role_mapping)
      %Ecto.Changeset{data: %UserRoleMapping{}}

  """
  def change_user_role_mapping(%UserRoleMapping{} = user_role_mapping, attrs \\ %{}) do
    UserRoleMapping.changeset(user_role_mapping, attrs)
  end
end
