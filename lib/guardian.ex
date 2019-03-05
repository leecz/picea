defmodule Picea.Guardian do
  use Guardian, otp_app: :picea

  def subject_for_token(resource, _claims) do
    sub = to_string(resource.id)
    {:ok, sub}
  end

  def subject_for_token(nil) do
    {:error, :reason_for_error}
  end

  def resource_from_claims(claims) do
    id = claims["sub"]
    resource = Picea.Accounts.get_user!(id)
    {:ok, resource}
  end

  def resource_from_claims() do
    {:error, :reason_for_error}
  end
end
