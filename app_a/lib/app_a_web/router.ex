defmodule AppAWeb.Router do
  use AppAWeb, :router
  import LiveAdmin.Router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_live_flash)
    plug(:put_root_layout, {AppAWeb.Layouts, :root})
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", AppAWeb do
    pipe_through(:browser)

    get("/", PageController, :home)

    live_admin("/admin",
      resources: [
        {AppB.Accounts.User, label_with: :email},
        {AppA.Admin.Role, label_with: :name},
        AppA.Admin.UserRoleMapping
      ]
    )
  end

  # Other scopes may use custom stacks.
  scope "/api", AppAWeb do
    pipe_through(:api)
    resources("/roles", RoleController, except: [:new, :edit])
    resources("/user_role_mappings", UserRoleMappingController, except: [:new, :edit])
  end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:app_a, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through(:browser)

      live_dashboard("/dashboard", metrics: AppAWeb.Telemetry)
      forward("/mailbox", Plug.Swoosh.MailboxPreview)
    end
  end
end
