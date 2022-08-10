defmodule SocialForumWeb.PageController do
  use SocialForumWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
