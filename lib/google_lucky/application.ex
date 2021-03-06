defmodule GoogleLucky.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      GoogleLuckyWeb.Endpoint
    ]

    children =
      if heroku_name = Application.get_env(:google_lucky, :heroku_name) do
        children ++ [{GoogleLucky.HerokuPing, heroku_name}]
      else
        children
      end

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: GoogleLucky.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    GoogleLuckyWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
