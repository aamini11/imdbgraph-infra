# Login to Cluster
az aks get-credentials \
    --resource-group rg-imdbgraph-staging \
    --name aks-imdbgraph \
    --overwrite-existing
# Encrypt .env -> sealed-secret.yaml
kubectl -n imdbgraph create secret generic imdbgraph-secrets \
    --from-env-file=.env.secret \
    --dry-run=client \
    -o json \
| kubeseal -f /dev/stdin -w ./apps/sealed-secret.yaml