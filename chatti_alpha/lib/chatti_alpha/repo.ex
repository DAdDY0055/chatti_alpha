defmodule ChattiAlpha.Repo do
  use Ecto.Repo,
    otp_app: :chatti_alpha,
    adapter: Ecto.Adapters.Postgres
end
