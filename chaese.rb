class Chaese
  NOT_QUITE_STRING_CHAESE = <<COOL_MESSAGE

         _--"-.
      .-"      "-.
     |""--..      '-.
     |      ""--..   '-.
     |.-. .-".    ""--..".
     |'./  -_'  .-.      |
     |      .-. '.-'   .-'
     '--..  '.'    .-  -.
          ""--..   '_'   :
                ""--..   |
                      ""-'
COOL_MESSAGE

  def initialize(app)
    @app = app
  end

  def call(env)
    puts NOT_QUITE_STRING_CHAESE * 10

    status, headers, response = @app.call(env)

    response = ["<title>The chaese stands alone.</title>",
                "<pre>", NOT_QUITE_STRING_CHAESE, "</pre>"]

    length = response.inject(0) { |a,e| a+e.size }.to_s
    headers["Content-Length"] = length

    [200, headers, response]
  end
end
