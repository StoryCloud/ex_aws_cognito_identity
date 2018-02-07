defmodule ExAws.CognitoIdentity do
  import ExAws.Utils, only: [camelize_keys: 1]

  @namespace "AWSCognitoIdentityService"

  def get_open_id_token_for_developer_identity(identity_pool_id, logins, token_duration, opts \\ []) do
    data = opts
    |> normalize_opts
    |> Map.merge(%{
      "IdentityPoolId" => identity_pool_id,
      "Logins" => logins,
      "TokenDuration" => token_duration,
    })
    request(:get_open_id_token_for_developer_identity, data, "/")
  end

  defp normalize_opts(opts) do
    opts
    |> Map.new
    |> camelize_keys
  end

  defp request(action, data, path) do
   operation = action
   |> Atom.to_string
   |> Macro.camelize

    ExAws.Operation.JSON.new(:"cognito-identity", %{
      path: path,
      data: data,
      headers: [
        {"x-amz-target", "#{@namespace}.#{operation}"},
        {"content-type", "application/x-amz-json-1.1"},
      ]
    })
  end
end
