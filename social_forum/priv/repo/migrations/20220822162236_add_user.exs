defmodule SocialForum.Repo.Migrations.AddUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string
      add :provide, :string
      add :token, :string

      timestamps()
    end
  end
end
