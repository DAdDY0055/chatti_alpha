defmodule ChattiAlphaWeb.PageController do
  use ChattiAlphaWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
