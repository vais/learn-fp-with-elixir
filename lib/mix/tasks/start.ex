defmodule Mix.Tasks.Start do
  use Mix.Task

  def run(params) do
    IO.puts("Hello there")
    IO.inspect(params)
  end
end
