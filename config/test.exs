import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :sticker_journal, StickerJournal.Repo,
  database: Path.expand("../sticker_journal_test.db", Path.dirname(__ENV__.file)),
  pool_size: 5,
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :sticker_journal, StickerJournalWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "yTuBh1kqGpjlcJm/+IOqjs/mQm/lo8G/sBd29OHBDYCMsZB7UNouvJyMQ+8IudJW",
  server: false

# In test we don't send emails.
config :sticker_journal, StickerJournal.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
