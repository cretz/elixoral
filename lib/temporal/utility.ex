defmodule Temporal.Utility do
  def is_proto(v) do
    is_struct(v) && Keyword.has_key?(v.__struct__.__info__(:functions), :__protobuf_info__)
  end
end
