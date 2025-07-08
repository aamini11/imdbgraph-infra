cd $(dirname "$0")

# Set up credentials
source .env

# Apply
cd ./deployments/staging
terraform init
terraform apply -auto-approve
