defmodule AppB.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children =
      [
        # Start the Telemetry supervisor
        AppBWeb.Telemetry,
        # Start the Ecto repository
        AppB.Repo,
        # Start the PubSub system
        {Phoenix.PubSub, name: AppB.PubSub},
        # Start Finch
        {Finch, name: AppB.Finch}
        # Start a worker by calling: AppB.Worker.start_link(arg)
        # {AppB.Worker, arg}
      ] ++
        if is_nil(Application.get_env(:app_b, :parent_endpoint)),
          do: [AppBWeb.Endpoint],
          else: []

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: AppB.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    AppBWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
