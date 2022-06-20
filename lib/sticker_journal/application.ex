defmodule StickerJournal.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      StickerJournal.Repo,
      # Start the Telemetry supervisor
      StickerJournalWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: StickerJournal.PubSub},
      # Start the Endpoint (http/https)
      StickerJournalWeb.Endpoint
      # Start a worker by calling: StickerJournal.Worker.start_link(arg)
      # {StickerJournal.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: StickerJournal.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    StickerJournalWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
