defmodule Q do
  require Logger
  def new do
    now = Timex.Date.now(:secs)
    id = U.create_string_id
    %{created: now, edited: now,viewed: now, asker: "you", reviewer: "me", question: "what is the meaning of this", id: id, answered: false}
  end
  def new(parent) when is_binary(parent) do
    q = new
    link(q,parent)
  end
  def new(map) when is_map(map) do
    q = new
    Map.merge(q,map)
  end
  @doc """
  create and store a new question
  """
  def create(q) do
    :ets.insert(:questions,{q.id,q})
    q
  end
  def all do
    :ets.tab2list(:questions)
  end
  def all(parent) do

  end
  def age(q) do
    now = Timex.Date.now(:secs)
    delta = now - q.edited
  end
  def age(q,field) do
    now = Timex.Date.now(:secs)
    delta = now - q[field]
  end
  def answer(id,answer) do
    a = %{qid: id, 
      answer: answer, 
      created: Timex.Date.now(:secs),
      accepted: false}
    true = :ets.insert(:answers, {id,a})
  end
  def link(q,parent) do
    Logger.error "link not done yet"
    q
  end

end
