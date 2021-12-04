use Mix.Config

config :advent_of_code, AdventOfCode.Input,
  allow_network?: true,
  # session_cookie: System.get_env("ADVENT_OF_CODE_SESSION_COOKIE")
  session_cookie: "53616c7465645f5fc2a2c0d925c2531ee8d04d2612029ca478214031c4e87c500df8737d2c07110da40097076c902cbb"

# If you don't like environment variables, put your cookie in
# a `config/secrets.exs` file like this:
#
# use Mix.Config
# config :advent_of_code, AdventOfCode.Input,
#   session_cookie: "..."

try do
  import_config "secrets.exs"
rescue
  _ -> :ok
end
