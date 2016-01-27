defmodule CalidMedia.PageController do
  use CalidMedia.Web, :controller
  alias CalidMedia.Media

  def index(conn, _params) do
    cond do
      _params == %{} ->
        filter = [".mp4", ".mp3"]
      _params == %{"show" => "video"} ->
        filter = [".mp4"]
      _params == %{"show" => "audio"} ->
        filter = [".mp3"]
    end

    media_dir = "./priv/static/media"
    {:ok, files} = File.ls(media_dir)
    filtered_files = Enum.filter(files, fn(file) -> String.ends_with?(file, filter) end)
    struct_files = Enum.map(filtered_files, fn(file) -> %CalidMedia.Media{filename: file} end )
    render conn, "index.html", files: struct_files
  end

  def show(conn, %{"filename" => filename}) do
    [name, ext] = String.split(filename, ".")
    render conn, "show.html", filename: filename, ext: ext
  end
end
