defmodule SocialForum.Repo do
  use Ecto.Repo,
    otp_app: :social_forum,
    adapter: Ecto.Adapters.Postgres
end
