defmodule FlexSite.Controllers.HomeController do
  use Flex.Controller

  defroute :index, "/" do
    _ = params

    html_response(
      conn,
      "home.html.eex",
      %{message: "Building beautiful web applications with ease"},
      title: "Welcome to Flex"
    )
  end

  defroute :about, "/about" do
    _ = params
    html_response(conn, "about.html.eex", %{}, title: "About Flex")
  end
end
