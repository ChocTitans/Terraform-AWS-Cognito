terraform {

    backend "s3" {
        bucket = "cognito-terraform-backend"
        key = "backend.tfstate"
        region = "eu-west-2"
        encrypt = true
        access_key = "AKIATLJMO3UH4XGZRW67"
        secret_key = "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"
    }

}