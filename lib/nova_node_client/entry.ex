defmodule NovaNodeClient.Entry do
  defstruct id: nil, source: nil, ts: nil, data: %{}

  alias NovaNodeClient.Entry

  def create(%Entry{} = entry) do
    NovaNodeClient.post("/api/entries", %{entry: entry})
    |> NovaNodeClient.process_response(&(&1))
  end
end
