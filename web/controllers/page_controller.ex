defmodule CalidMedia.PageController do
  use CalidMedia.Web, :controller
  alias CalidMedia.Media

  def index(conn, _params) do
    media_dir = "./priv/static/media"
    {:ok, files} = File.ls(media_dir)
    filtered_files = Enum.filter(files, fn(file) -> String.ends_with?(file, [".mp4", ".mp3"]) end)
    struct_files = Enum.map(filtered_files, fn(file) -> %CalidMedia.Media{filename: file} end )
    render conn, "index.html", files: struct_files
  end

  def show(conn, %{"filename" => filename}) do
    [name, ext] = String.split(filename, ".")
    render conn, "show.html", filename: filename, ext: ext
  end
end
