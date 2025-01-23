# terraform {
#    backend "s3" {
#        bucket = "kaizen-aminama"
#        key = "terraform.tfstate"
#        region = "us-east-1"
#        dynamodb_table = "lock-state"
#   }
# }

# Store in remote backend
# Version statefile
# Lock statefile
# Secure it (access)