terraform {

    backend "s3" {
        bucket = "cognito-terraform-backend"
        key = "backend.tfstate"
        encrypt = true
        dynamodb_table = "tf-backend"
        region = "eu-west-2"
    }

}