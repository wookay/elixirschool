defmodule ExampleTest do
  use ExUnit.Case
  doctest Example

  test "greets the world" do
    assert Example.hello() == :world
  end


  test "atom test" do
    assert :hello == :hello
    assert is_atom(true)
    assert is_boolean(true)
    assert :true == true
    assert :true === true
    assert is_atom(ExampleTest)
  end

  test "string" do
    assert String.length("") == 0
    assert (String.length "") == 0
    assert (String.length "안녕하세요") == 5
    assert String.split("Hello World", " ") == ["Hello", "World"]
  end

  test "list" do
    assert is_list([])
    assert !is_list("")
    list = [3.14, :pie, "Apple"]
    assert is_list(list)
    assert ["π" | list]  == ["π", 3.14, :pie, "Apple"]
    assert ["π"] ++ list == ["π", 3.14, :pie, "Apple"]
    assert [1, 2] ++ [3, 4, 1] == [1, 2, 3, 4, 1]
    assert [1, 2] -- [3, 4, 1] == [2]
    assert hd([3.14, :pie, "Apple"]) == 3.14
    assert tl([3.14, :pie, "Apple"]) == [:pie, "Apple"]
    [h | t] = [3.14, :pie, "Apple"]
    assert h == 3.14   
    assert t == [:pie, "Apple"]
  end

  test "tuple" do
    assert is_tuple({})
    assert is_tuple({3.14, :pie, "Apple"})
  end

  test "pattern matching - Match Operator =" do
    1 = 1
    x = 1
    1 = x
  end

  test "pattern matching - Pin Operator ^" do
    x = 1
    _ = x
    x = 2
    _ = x
    

    x = 1
    _ = x
    # ^x = 2 # error
  end

  test "meta programming" do
    expr = quote do: 1 +  2
    assert is_tuple(expr)

    denominator = 2
    quote do: divide(42, denominator)
    # {:divide, [], [42, {:denominator, [], Elixir}]}

    quote do: divide(42, unquote(denominator))
    # {:divide, [], [42, 2]}

    # quoted expression
    %{}
    %{body: 1}
  end

end
