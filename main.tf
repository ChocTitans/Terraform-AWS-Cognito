resource "aws_cognito_user_pool_domain" "example" {
  domain       = "openfga"  # Replace with your desired domain name
  user_pool_id = aws_cognito_user_pool.example.id
}

resource "aws_cognito_user_pool" "example" {
  name            = "example-user-pool"
  alias_attributes = ["email"] # Email is the only alias attribute
  auto_verified_attributes = ["email"]
  password_policy {
    minimum_length   = 8
    require_lowercase = true
    require_numbers   = true
    require_symbols   = true
    require_uppercase = true
  }

  schema {
    name             = "email"
    attribute_data_type = "String"
    required         = true
  }
}

resource "aws_cognito_user_pool_client" "example" {
  name                    = "openfga"
  user_pool_id            = aws_cognito_user_pool.example.id
  generate_secret         = true
  allowed_oauth_flows     = ["code"]
  allowed_oauth_flows_user_pool_client = true
  allowed_oauth_scopes    = ["openid"]
  callback_urls = [
    "https://k8s-ttveks-71b23f59a8-597424130.eu-west-2.elb.amazonaws.com/oauth2/idpresponse",
    "https://openfga.auth.eu-west-2.amazoncognito.com/saml2/idpresponse",
    "https://openfga.promosales.me/oauth2/idpresponse",
  ]
  supported_identity_providers = ["COGNITO"]
}


output "user_pool_id" {
  value = aws_cognito_user_pool.example.id
}
