defmodule GoogleLucky.HerokuPing do
  use GenServer

  def start_link(url) do
    GenServer.start_link(__MODULE__, url)
  end

  @impl true
  def init(url) do
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