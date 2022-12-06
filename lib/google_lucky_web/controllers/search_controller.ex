defmodule GoogleLuckyWeb.SearchController do
  use GoogleLuckyWeb, :controller

  def search(conn, %{"q" => _} = params) do
    case GoogleLucky.Search.search(params) do
      {:ok, url} ->
        redirect(conn, external: url)
      {:error, error} ->
        html(conn, error)
    end
  end

  def search(conn, _params) do
    html(conn, "q parameter missing from request")
  end
end
