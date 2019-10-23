defmodule GoogleLucky.HerokuPing do
  use GenServer

  def start_link(heroku_name) do
    GenServer.start_link(__MODULE__, heroku_name)
  end

  @impl true
  def init(heroku_name) do
    url = "https://#{heroku_name}.herokuapp.com"
    loop()
    {:ok, url}
  end

  @impl true
  def handle_info(:ping, url) do
    HTTPoison.get(url)
    loop()
    {:noreply, url}
  end

  defp loop() do
    Process.send_after(self(), :ping, 20 * 60 * 1000)
  end
end