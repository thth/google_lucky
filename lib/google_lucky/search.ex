defmodule GoogleLucky.Search do
  def search(params) do
    # maybe in future add option in config to add additional params per API
    url = "https://www.googleapis.com/customsearch/v1"

    params =
      Application.fetch_env!(:google_lucky, GoogleLucky.Search)
      |> Map.merge(params)
      |> Map.put("num", "1")

    case HTTPoison.get(url, [], params: params) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        link = get_url_from_response_body(body)
        {:ok, link}
      {:ok, %HTTPoison.Response{body: body}} ->
        {:error, body}
      {:error, error} ->
        {:error, Kernel.inspect(error)}
    end
  end

  defp get_url_from_response_body(body) do
    %{
      "items" => [
        %{
          "link" => link
        }
      ]
    } = Jason.decode!(body)

    link
  end
end
