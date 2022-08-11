defmodule SocialForum.Topic.Topics do
  use Ecto.Schema
  import Ecto.Changeset

  schema "topics" do


    timestamps()
  end

  @doc false
  def changeset(topics, attrs) do
    topics
    |> cast(attrs, [])
    |> validate_required([])
  end
end
