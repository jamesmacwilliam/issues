defmodule Issues.GithubIssuesTest do
  use ExUnit.Case
  doctest Issues

  import Issues.GithubIssues

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
end
