terraform {

    backend "s3" {
        bucket = "cognito-terraform-backend"
        key = "backend.tfstate"
        encrypt = true
        dynamodb_table = "tf-backend"

        region     = jsondecode(file("$secrets.auto.tfvars")).region
        access_key = jsondecode(file("$secrets.auto.tfvars")).access_key
        secret_key = jsondecode(file("$secrets.auto.tfvars")).secret_key
        
    }

}