defmodule ExAws.CognitoIdentityTest do
  use ExUnit.Case
  alias ExAws.CognitoIdentity

  test "get_open_id_token_for_developer_identity" do
    assert CognitoIdentity.get_open_id_token_for_developer_identity("us-east-1:177a950c-2c08-43f0-9983-28727EXAMPLE", %{"provider" => "identity123"}, 3600).data == %{
      "IdentityPoolId" => "us-east-1:177a950c-2c08-43f0-9983-28727EXAMPLE",
      "Logins" => %{"provider" => "identity123"},
      "TokenDuration" => 3600
    }
  end
end
