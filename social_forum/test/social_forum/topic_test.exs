defmodule SocialForum.TopicTest do
  use SocialForum.DataCase

  alias SocialForum.Topic

  describe "topics" do
    alias SocialForum.Topic.Topics

    import SocialForum.TopicFixtures

    @invalid_attrs %{}

    test "list_topics/0 returns all topics" do
      topics = topics_fixture()
      assert Topic.list_topics() == [topics]
    end

    test "get_topics!/1 returns the topics with given id" do
      topics = topics_fixture()
      assert Topic.get_topics!(topics.id) == topics
    end

    test "create_topics/1 with valid data creates a topics" do
      valid_attrs = %{}

      assert {:ok, %Topics{} = topics} = Topic.create_topics(valid_attrs)
    end

    test "create_topics/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Topic.create_topics(@invalid_attrs)
    end

    test "update_topics/2 with valid data updates the topics" do
      topics = topics_fixture()
      update_attrs = %{}

      assert {:ok, %Topics{} = topics} = Topic.update_topics(topics, update_attrs)
    end

    test "update_topics/2 with invalid data returns error changeset" do
      topics = topics_fixture()
      assert {:error, %Ecto.Changeset{}} = Topic.update_topics(topics, @invalid_attrs)
      assert topics == Topic.get_topics!(topics.id)
    end

    test "delete_topics/1 deletes the topics" do
      topics = topics_fixture()
      assert {:ok, %Topics{}} = Topic.delete_topics(topics)
      assert_raise Ecto.NoResultsError, fn -> Topic.get_topics!(topics.id) end
    end

    test "change_topics/1 returns a topics changeset" do
      topics = topics_fixture()
      assert %Ecto.Changeset{} = Topic.change_topics(topics)
    end
  end
end
