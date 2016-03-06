defmodule U do
  
  def mock do
    setup_ets
    mock_users
    mock_questions
    mock_answers
  end
  def setup_ets do
    :ets.new(:users, [:set, :public, :named_table])
    :ets.new(:questions, [:set,:public,:named_table])
    :ets.new(:answers, [:set, :public,:named_table])
    IO.puts "created ets" 
  end
  def mock_user do
    
    #%{id: randid,name: "test user"}
  end
  def mock_users do
    me = %{id: 1,name: "me"}
    you = %{id: 2,name: "you"}
    :ets.insert(:users,{me.id,me})
    :ets.insert(:users,{you.id,you})
      
  end
  def mock_question do
    q = Q.new
    :ets.insert(:questions,{q.id,q})
  end
  def mock_questions do
    Enum.each(1..10, fn(i) -> 
      mock_question
    end)
  end
  def mock_answers do
    [{id,q}|all] = Q.all
    I.p "q is: ",q
    Q.answer(id,"because why") 
    [{id,q}|all] = all
    Q.answer(id,"because i said so") 
  end
  def create_string_id(type \\:default) when is_atom(type) do
    id = UUID.uuid4(:hex)
    #@id_types[type] <> id
  end
  
end
defmodule I do
  def p(term) do
    IO.puts inspect term, pretty: true
  end
  def p(description, term) do
    IO.puts description <> inspect term, pretty: true
  end
end
