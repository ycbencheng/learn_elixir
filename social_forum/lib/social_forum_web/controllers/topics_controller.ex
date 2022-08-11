defmodule SocialForumWeb.TopicsController do
  use SocialForumWeb, :controller

  alias SocialForum.Topic
  alias SocialForum.Topic.Topics

  def index(conn, _params) do
    topics = Topic.list_topics()
    render(conn, "index.html", topics: topics)
  end

  def new(conn, _params) do
    changeset = Topic.change_topics(%Topics{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"topics" => topics_params}) do
    case Topic.create_topics(topics_params) do
      {:ok, topics} ->
        conn
        |> put_flash(:info, "Topics created successfully.")
        |> redirect(to: Routes.topics_path(conn, :show, topics))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    topics = Topic.get_topics!(id)
    render(conn, "show.html", topics: topics)
  end

  def edit(conn, %{"id" => id}) do
    topics = Topic.get_topics!(id)
    changeset = Topic.change_topics(topics)
    render(conn, "edit.html", topics: topics, changeset: changeset)
  end

  def update(conn, %{"id" => id, "topics" => topics_params}) do
    topics = Topic.get_topics!(id)

    case Topic.update_topics(topics, topics_params) do
      {:ok, topics} ->
        conn
        |> put_flash(:info, "Topics updated successfully.")
        |> redirect(to: Routes.topics_path(conn, :show, topics))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", topics: topics, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    topics = Topic.get_topics!(id)
    {:ok, _topics} = Topic.delete_topics(topics)

    conn
    |> put_flash(:info, "Topics deleted successfully.")
    |> redirect(to: Routes.topics_path(conn, :index))
  end
end
