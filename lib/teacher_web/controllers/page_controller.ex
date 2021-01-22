defmodule TeacherWeb.PageController do
  use TeacherWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def show(conn, %{"id" => id}) do
    [{_key, airport}] = :ets.lookup(:airports, id)
    render conn, "show.html", airport: airport
  end

end
