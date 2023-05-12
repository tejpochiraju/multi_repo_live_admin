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

  describe "user_role_mappings" do
    alias AppA.Admin.UserRoleMapping

    import AppA.AdminFixtures

    @invalid_attrs %{}

    test "list_user_role_mappings/0 returns all user_role_mappings" do
      user_role_mapping = user_role_mapping_fixture()
      assert Admin.list_user_role_mappings() == [user_role_mapping]
    end

    test "get_user_role_mapping!/1 returns the user_role_mapping with given id" do
      user_role_mapping = user_role_mapping_fixture()
      assert Admin.get_user_role_mapping!(user_role_mapping.id) == user_role_mapping
    end

    test "create_user_role_mapping/1 with valid data creates a user_role_mapping" do
      valid_attrs = %{}

      assert {:ok, %UserRoleMapping{} = user_role_mapping} = Admin.create_user_role_mapping(valid_attrs)
    end

    test "create_user_role_mapping/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Admin.create_user_role_mapping(@invalid_attrs)
    end

    test "update_user_role_mapping/2 with valid data updates the user_role_mapping" do
      user_role_mapping = user_role_mapping_fixture()
      update_attrs = %{}

      assert {:ok, %UserRoleMapping{} = user_role_mapping} = Admin.update_user_role_mapping(user_role_mapping, update_attrs)
    end

    test "update_user_role_mapping/2 with invalid data returns error changeset" do
      user_role_mapping = user_role_mapping_fixture()
      assert {:error, %Ecto.Changeset{}} = Admin.update_user_role_mapping(user_role_mapping, @invalid_attrs)
      assert user_role_mapping == Admin.get_user_role_mapping!(user_role_mapping.id)
    end

    test "delete_user_role_mapping/1 deletes the user_role_mapping" do
      user_role_mapping = user_role_mapping_fixture()
      assert {:ok, %UserRoleMapping{}} = Admin.delete_user_role_mapping(user_role_mapping)
      assert_raise Ecto.NoResultsError, fn -> Admin.get_user_role_mapping!(user_role_mapping.id) end
    end

    test "change_user_role_mapping/1 returns a user_role_mapping changeset" do
      user_role_mapping = user_role_mapping_fixture()
      assert %Ecto.Changeset{} = Admin.change_user_role_mapping(user_role_mapping)
    end
  end
end
