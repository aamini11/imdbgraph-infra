FILE_DIR=$(dirname "$0")

cd $FILE_DIR
source .env
export TF_VAR_github_token=$GITHUB_TOKEN
cd ./deployments/staging
terraform init
terraform apply -auto-approve
