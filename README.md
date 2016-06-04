# Issues

**TODO: Add description**

## Installation
- mix deps.get
- run with `./issues <git-user> <git-project> <count-issues-to-return>`
- ie: `./issues elixir-lang elixir 3`

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add issues to your list of dependencies in `mix.exs`:

        def deps do
          [{:issues, "~> 0.0.1"}]
        end

  2. Ensure issues is started before your application:

        def application do
          [applications: [:issues]]
        end

