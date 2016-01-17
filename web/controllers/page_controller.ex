defmodule CalidMedia.PageController do
  use CalidMedia.Web, :controller

  def index(conn, _params) do
    media_dir = "./priv/static/media"
    {:ok, files} = File.ls(media_dir)
    filtered_files = Enum.filter(files, fn(file) -> String.ends_with?(file, [".mp4", ".mp3", ".avi"]) end)
    render conn, "index.html", files: filtered_files
  end

  def show(conn, file) do
    IO.inspect(file)
  end
end
