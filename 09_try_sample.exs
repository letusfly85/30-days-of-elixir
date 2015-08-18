defmodule MyAlive do

  def my_alive() do 
    try do
      alive? = Regex.match?(~r/packet loss/, "packet loss")
      {:ok, alive?}
      
    rescue
      e -> {:error, e}
    end
  end
end

IO.inspect MyAlive.my_alive
