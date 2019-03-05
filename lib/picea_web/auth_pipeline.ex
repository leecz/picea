defmodule Picea.Guardian.AuthPipeline do
  use Guardian.Plug.Pipeline,
    otp_app: :Picea,
    module: Picea.Guardian,
    error_handler: Picea.AuthErrorHandler

  plug Guardian.Plug.VerifyHeader, realm: "Bearer"
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource
end
