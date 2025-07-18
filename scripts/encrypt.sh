# Login to Cluster
az aks get-credentials \
    --resource-group rg-imdbgraph-staging \
    --name aks-imdbgraph \
    --overwrite-existing

cd $(dirname "$0")/../kubernetes/apps/imdbgraph-api/staging
# Encrypt .env -> sealed-secret.yaml
kubectl -n imdbgraph create secret generic imdbgraph-secrets \
    --from-env-file=.env \
    --dry-run=client \
    -o json \
| kubeseal -f /dev/stdin -w sealed-secret.yaml