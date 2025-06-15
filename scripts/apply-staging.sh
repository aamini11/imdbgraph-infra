FILE_DIR=$(dirname "$0")

cd $FILE_DIR
source .env.staging
cd ../terraform/deployments/staging
terraform init
terraform apply -auto-approve
