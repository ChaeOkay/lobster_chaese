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

    response.write "<title>The chaese stands alone.</title>"
    response.write "<pre> #{NOT_QUITE_STRING_CHAESE} </pre>"
    headers["Content-Length"] = response.length.to_s

    [status, headers, response]
  end
end
