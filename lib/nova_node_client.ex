defmodule NovaNodeClient do
  @moduledoc """
  The HTTP client for NovaNode.
  """

  use HTTPoison.Base

  @endpoint Application.get_env(:nova_node_client, :endpoint, "")

  def process_url(url) do
    @endpoint <> url
  end

  def process_request_body(%{} = body), do: Poison.encode!(body)
  def process_request_body(body), do: body

  def process_request_headers(headers) do
    Enum.into(headers, [{"Accept", "application/json"}, {"Content-Type", "application/json"}])
  end

  def process_response_body(body) do
    case Poison.decode(body) do
      {:ok, json_body} -> json_body
      {:error, _} -> %{}
    end
  end

  def process_response({:error, response}, _process_data), do: {:error, response}
  def process_response({:ok, %HTTPoison.Response{} = response}, process_data) do
    cond do
      response.status_code in [200, 201] ->
        {:ok, process_data.(response.body["data"])}
      true ->
        {:error, response}
    end
  end
end
