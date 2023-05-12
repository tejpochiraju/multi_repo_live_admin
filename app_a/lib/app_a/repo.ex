defmodule AppA.Repo do
  use Ecto.Repo,
    otp_app: :app_a,
    adapter: Ecto.Adapters.SQLite3
end
