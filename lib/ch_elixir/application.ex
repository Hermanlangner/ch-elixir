defmodule ChElixir.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      ChElixirWeb.Telemetry,
      # Start the Ecto repository
      ChElixir.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: ChElixir.PubSub},
      # Start Finch
      {Finch, name: ChElixir.Finch},
      # Start the Endpoint (http/https)
      ChElixirWeb.Endpoint
      # Start a worker by calling: ChElixir.Worker.start_link(arg)
      # {ChElixir.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ChElixir.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ChElixirWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
