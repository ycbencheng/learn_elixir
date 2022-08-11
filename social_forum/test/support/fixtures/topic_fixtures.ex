defmodule SocialForum.TopicFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `SocialForum.Topic` context.
  """

  @doc """
  Generate a topics.
  """
  def topics_fixture(attrs \\ %{}) do
    {:ok, topics} =
      attrs
      |> Enum.into(%{

      })
      |> SocialForum.Topic.create_topics()

    topics
  end
end
