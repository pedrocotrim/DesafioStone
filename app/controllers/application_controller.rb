class ApplicationController < ActionController::API
  def authorize_call
    token = request.headers["HTTP_AUTHORIZATION"]
    if !token
      msg = "Nenhum token foi enviado"
    else
      msg = "O token enviado é inválido"
    end
    @app = App.find_by(authentication_token: token)
    if !@app
      puts token
      render json: {erro: msg}, status: :unauthorized
    else
      @cost_center = @app.cost_center
    end
  end
end
