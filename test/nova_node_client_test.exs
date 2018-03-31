defmodule NovaNodeClientTest do
  use ExUnit.Case
  doctest NovaNodeClient

  test "greets the world" do
    assert NovaNodeClient.hello() == :world
  end
end
