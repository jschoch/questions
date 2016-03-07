defmodule QuestionsTest do
  use ExUnit.Case
  setup do
    U.mock
    :ok
  end 
  test "new question" do
    q = Q.new
    I.p "new question: " ,q
    assert q.answered == false
    assert q.id != nil
  end
  test "gets age" do
    IO.puts "sleeping 1 second"
    :timer.sleep(1000)
    [{id,q} | tail] = Q.all
    age = Q.age(q)
    I.p "age: ", age
    assert age > 0
    then = Timex.Date.now(:secs) -5000
    q = Q.new(%{created: then})
    I.p "aged q: ", q
    age = Q.age(q,:created)
    assert age >= 5
  end
  test "find questions older than" do
    day = 86400000 + 1000
    then = Timex.Date.now(:secs ) - day
    q = Q.new(%{created: then})|> Q.create
    list = Nag.run
    assert list != []
    assert list != nil
    assert list == [q]
  end
  
end
