defmodule Nag do
  @day 86400000
  def run do
    IO.puts "."
    run(@day)
  end
  def run(then) do
    Enum.reduce(Q.all,[],fn({id,q},acc) -> 
      age = Q.age(q,:created)
      case age do
        age when age > then ->  
          IO.puts "age was : #{age}"
          [q|acc]
        _ -> 
          acc

      end
    end)
  end
end
