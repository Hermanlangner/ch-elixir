defmodule ChElixir.Repo do
  use Ecto.Repo,
    otp_app: :ch_elixir,
    adapter: Ecto.Adapters.Postgres
end
