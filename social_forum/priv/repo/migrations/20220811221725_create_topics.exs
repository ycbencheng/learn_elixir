defmodule SocialForum.Repo.Migrations.CreateTopics do
  use Ecto.Migration

  def change do
    create table(:topics) do

      timestamps()
    end
  end
end
