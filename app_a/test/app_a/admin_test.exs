defmodule AppA.AdminTest do
  use AppA.DataCase

  alias AppA.Admin

  describe "roles" do
    alias AppA.Admin.Role

    import AppA.AdminFixtures

    @invalid_attrs %{name: nil}

    test "list_roles/0 returns all roles" do
      role = role_fixture()
      assert Admin.list_roles() == [role]
    end

    test "get_role!/1 returns the role with given id" do
      role = role_fixture()
      assert Admin.get_role!(role.id) == role
    end

    test "create_role/1 with valid data creates a role" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Role{} = role} = Admin.create_role(valid_attrs)
      assert role.name == "some name"
    end

    test "create_role/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Admin.create_role(@invalid_attrs)
    end

    test "update_role/2 with valid data updates the role" do
      role = role_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Role{} = role} = Admin.update_role(role, update_attrs)
      assert role.name == "some updated name"
    end

    test "update_role/2 with invalid data returns error changeset" do
      role = role_fixture()
      assert {:error, %Ecto.Changeset{}} = Admin.update_role(role, @invalid_attrs)
      assert role == Admin.get_role!(role.id)
    end

    test "delete_role/1 deletes the role" do
      role = role_fixture()
      assert {:ok, %Role{}} = Admin.delete_role(role)
      assert_raise Ecto.NoResultsError, fn -> Admin.get_role!(role.id) end
    end

    test "change_role/1 returns a role changeset" do
      role = role_fixture()
      assert %Ecto.Changeset{} = Admin.change_role(role)
    end
  end
end
