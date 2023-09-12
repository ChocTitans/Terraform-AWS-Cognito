terraform {

    backend "s3" {
        bucket = "cognito-terraform-backend"
        key = "backend.tfstate"
        region = "${var.aws_region}"
        encrypt = true
        dynamodb_table = "tf-backend"
    }

}