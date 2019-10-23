# In this file, we load production configuration and
# secrets from environment variables. You can also
# hardcode secrets, although such is generally not
# recommended and you have to remember to add this
# file to your .gitignore.
use Mix.Config

secret_key_base =
  System.get_env("SECRET_KEY_BASE") ||
    raise """
    environment variable SECRET_KEY_BASE is missing.
    You can generate one by calling: mix phx.gen.secret
    """

config :google_lucky, GoogleLuckyWeb.Endpoint,
  http: [:inet6, port: String.to_integer(System.get_env("PORT") || "4000")],
  secret_key_base: secret_key_base

cse_id = System.get_env("GOOGLE_CSE_ID") ||
  raise "Environment variable GOOGLE_CSE_ID is missing."
api_key = System.get_env("GOOGLE_API_KEY") ||
  raise "Environment variable GOOGLE_API_KEY is missing."
heroku_name = System.get_env("GOOGLE_HEROKU_NAME")

config :google_lucky, GoogleLucky.Search, %{
  "cx" => cse_id,
  "key" => api_key
}

config :google_lucky, :heroku_name, heroku_name