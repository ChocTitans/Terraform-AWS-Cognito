terraform {
    backend "s3" {
        bucket = "cognito-terraform-backend"
        key = "backend.tfstate"
        encrypt = true
    }
}