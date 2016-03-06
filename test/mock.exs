defmodule MockTest do
  use ExUnit.Case
  
  test "the truth" do
    U.setup_ets
    r = :ets.insert(:users, {:foo,:bar})
    assert r == true
    I.p "insert result: ", r
  end
  test "mock users" do
    U.setup_ets
    U.mock_users
    r = :ets.lookup(:users, 1)
    I.p r
    [{id,user}] = r
    assert user.name == "me"
  end
  test "mock questions" do
    U.setup_ets
    U.mock_questions
    all = Q.all
    assert all != []
    assert all != nil
    I.p "questoins: ", Enum.count all
  end
  test "mock answers" do
    U.setup_ets
    U.mock_questions
    U.mock_answers
    l = :ets.tab2list(:answers) 
    assert Enum.count(l) == 2
  end
  test "mock all works" do
    U.mock
  end
  
end
