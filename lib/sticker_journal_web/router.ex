defmodule StickerJournalWeb.Router do
  use StickerJournalWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {StickerJournalWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", StickerJournalWeb do
    pipe_through :browser

    live "/", JournalHomeLive

    live "/sticker_type", StickerTypeLive.Index, :index
    live "/sticker_type/new", StickerTypeLive.Index, :new
    live "/sticker_type/:id/edit", StickerTypeLive.Index, :edit

    live "/sticker_type/:id", StickerTypeLive.Show, :show
    live "/sticker_type/:id/show/edit", StickerTypeLive.Show, :edit

    live "/sticker_group", StickerGroupLive.Index, :index
    live "/sticker_group/new", StickerGroupLive.Index, :new
    live "/sticker_group/:id/edit", StickerGroupLive.Index, :edit

    live "/sticker_group/:id", StickerGroupLive.Show, :show
    live "/sticker_group/:id/show/edit", StickerGroupLive.Show, :edit

  end

  # Other scopes may use custom stacks.
  # scope "/api", StickerJournalWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: StickerJournalWeb.Telemetry
    end
  end

  # Enables the Swoosh mailbox preview in development.
  #
  # Note that preview only shows emails that were sent by the same
  # node running the Phoenix server.
  if Mix.env() == :dev do
    scope "/dev" do
      pipe_through :browser

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
