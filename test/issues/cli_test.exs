defmodule Issues.CLITest do
  use ExUnit.Case
  doctest Issues

  import Issues.CLI, only: [
    parse_args: 1,
    sort_into_ascending_order: 1,
    convert_to_list_of_maps: 1
  ]

  test "sort ascending orders the correct way" do
    result = sort_into_ascending_order(fake_created_at_list(["c", "a", "b"]))
    issues = for issue <- result, do: issue["created_at"]
    assert issues == ~w{a b c}
  end

  test ":help returned by option parsing with -h option" do
    assert parse_args(["-h", "anything"]) == :help
  end

  test ":help returned by option parsing with --help option" do
    assert parse_args(["--help", "anything"]) == :help
  end

  test "three values returned if three given" do
    assert parse_args(["user", "project", "99"]) == { "user", "project", 99 }
  end
  test "count is defaulted if two values given" do
    assert parse_args(["user", "project"]) == { "user", "project", 4 }
  end

  defp fake_created_at_list(values) do
    data = for value <- values,
           do: [{"created_at", value}, {"other_data", "xxx"} ]
    convert_to_list_of_maps data
  end
end
