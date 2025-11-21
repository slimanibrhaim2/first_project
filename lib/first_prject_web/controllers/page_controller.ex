defmodule FirstPrjectWeb.PageController do
  use FirstPrjectWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
