defmodule AppAWeb.UserRoleMappingControllerTest do
  use AppAWeb.ConnCase

  import AppA.AdminFixtures

  alias AppA.Admin.UserRoleMapping

  @create_attrs %{

  }
  @update_attrs %{

  }
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all user_role_mappings", %{conn: conn} do
      conn = get(conn, ~p"/api/user_role_mappings")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create user_role_mapping" do
    test "renders user_role_mapping when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/user_role_mappings", user_role_mapping: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/user_role_mappings/#{id}")

      assert %{
               "id" => ^id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/user_role_mappings", user_role_mapping: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update user_role_mapping" do
    setup [:create_user_role_mapping]

    test "renders user_role_mapping when data is valid", %{conn: conn, user_role_mapping: %UserRoleMapping{id: id} = user_role_mapping} do
      conn = put(conn, ~p"/api/user_role_mappings/#{user_role_mapping}", user_role_mapping: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/user_role_mappings/#{id}")

      assert %{
               "id" => ^id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, user_role_mapping: user_role_mapping} do
      conn = put(conn, ~p"/api/user_role_mappings/#{user_role_mapping}", user_role_mapping: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete user_role_mapping" do
    setup [:create_user_role_mapping]

    test "deletes chosen user_role_mapping", %{conn: conn, user_role_mapping: user_role_mapping} do
      conn = delete(conn, ~p"/api/user_role_mappings/#{user_role_mapping}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/user_role_mappings/#{user_role_mapping}")
      end
    end
  end

  defp create_user_role_mapping(_) do
    user_role_mapping = user_role_mapping_fixture()
    %{user_role_mapping: user_role_mapping}
  end
end
