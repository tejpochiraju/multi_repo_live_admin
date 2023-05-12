defmodule AppAWeb.RoleController do
  use AppAWeb, :controller

  alias AppA.Admin
  alias AppA.Admin.Role

  action_fallback AppAWeb.FallbackController

  def index(conn, _params) do
    roles = Admin.list_roles()
    render(conn, :index, roles: roles)
  end

  def create(conn, %{"role" => role_params}) do
    with {:ok, %Role{} = role} <- Admin.create_role(role_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/roles/#{role}")
      |> render(:show, role: role)
    end
  end

  def show(conn, %{"id" => id}) do
    role = Admin.get_role!(id)
    render(conn, :show, role: role)
  end

  def update(conn, %{"id" => id, "role" => role_params}) do
    role = Admin.get_role!(id)

    with {:ok, %Role{} = role} <- Admin.update_role(role, role_params) do
      render(conn, :show, role: role)
    end
  end

  def delete(conn, %{"id" => id}) do
    role = Admin.get_role!(id)

    with {:ok, %Role{}} <- Admin.delete_role(role) do
      send_resp(conn, :no_content, "")
    end
  end
end
