defmodule Secureapp.PageController do
  use Secureapp.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
