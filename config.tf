terraform {

    backend "s3" {
        bucket = "cognito-terraform-backend"
        key = "backend.tfstate"
        region = "eu-west-2"
        encrypt = true
        dynamodb_table = "tf-backend"
        profile = "ttv-profile"
    }

}