defmodule FirstPrject.Repo do
  use Ecto.Repo,
    otp_app: :first_prject,
    adapter: Ecto.Adapters.Postgres
end
