defmodule CalidMedia.Media do
  @derive {Phoenix.Param, key: :filename}
  defstruct [:filename]
end
