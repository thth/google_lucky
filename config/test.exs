import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :google_lucky, GoogleLuckyWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "P+axe0YlRBmpWj0WvMh3MgMmO6GUE4Rph1IeIL3UdXP4yzqFuvppIt4R61nLwNFm",
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
