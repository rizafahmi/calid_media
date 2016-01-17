defmodule CalidMedia.PageController do
  use CalidMedia.Web, :controller

  def index(conn, _params) do
    media_dir = "./priv/static/media"
    {:ok, files} = File.ls(media_dir)
    render conn, "index.html", files: files
  end
end
