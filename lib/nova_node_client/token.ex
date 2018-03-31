defmodule NovaNodeClient.Token do
  defstruct id: nil, key: nil, secret: nil, inserted_at: nil, updated_at: nil
  
  alias NovaNodeClient.Token

  def list do
    NovaNodeClient.get("/api/tokens")
    |> NovaNodeClient.process_response(&many_from_data/1)
  end

  def get(id) do
    NovaNodeClient.get("/api/tokens/#{id}")
    |> NovaNodeClient.process_response(&from_data/1)
  end

  def create(%Token{} = token) do
    NovaNodeClient.post("/api/tokens", %{token: token})
    |> NovaNodeClient.process_response(&from_data/1)
  end

  def create_random do
    NovaNodeClient.post("/api/tokens/random", %{})
    |> NovaNodeClient.process_response(&from_data/1)
  end

  def many_from_data(data) do
    Enum.map(data, &from_data(&1))
  end

  def from_data(data) do
    %Token{
      id: data["id"],
      key: data["key"],
      secret: data["secret"],
      inserted_at: data["inserted_at"],
      updated_at: data["updated_at"]
    }
  end
end
