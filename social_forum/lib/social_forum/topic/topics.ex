defmodule SocialForum.Topic.Topics do
  use Ecto.Schema
  import Ecto.Changeset

  schema "topics" do
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(topics, attrs) do
    topics
    |> cast(attrs, [:title, :inserted_at])
    |> validate_required([:title, :inserted_at])
  end
end
