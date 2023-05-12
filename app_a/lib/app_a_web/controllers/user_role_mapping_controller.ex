defmodule AppAWeb.UserRoleMappingController do
  use AppAWeb, :controller

  alias AppA.Admin
  alias AppA.Admin.UserRoleMapping

  action_fallback AppAWeb.FallbackController

  def index(conn, _params) do
    user_role_mappings = Admin.list_user_role_mappings()
    render(conn, :index, user_role_mappings: user_role_mappings)
  end

  def create(conn, %{"user_role_mapping" => user_role_mapping_params}) do
    with {:ok, %UserRoleMapping{} = user_role_mapping} <- Admin.create_user_role_mapping(user_role_mapping_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/user_role_mappings/#{user_role_mapping}")
      |> render(:show, user_role_mapping: user_role_mapping)
    end
  end

  def show(conn, %{"id" => id}) do
    user_role_mapping = Admin.get_user_role_mapping!(id)
    render(conn, :show, user_role_mapping: user_role_mapping)
  end

  def update(conn, %{"id" => id, "user_role_mapping" => user_role_mapping_params}) do
    user_role_mapping = Admin.get_user_role_mapping!(id)

    with {:ok, %UserRoleMapping{} = user_role_mapping} <- Admin.update_user_role_mapping(user_role_mapping, user_role_mapping_params) do
      render(conn, :show, user_role_mapping: user_role_mapping)
    end
  end

  def delete(conn, %{"id" => id}) do
    user_role_mapping = Admin.get_user_role_mapping!(id)

    with {:ok, %UserRoleMapping{}} <- Admin.delete_user_role_mapping(user_role_mapping) do
      send_resp(conn, :no_content, "")
    end
  end
end
