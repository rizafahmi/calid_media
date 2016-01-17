defmodule CalidMedia.PageController do
  use CalidMedia.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
