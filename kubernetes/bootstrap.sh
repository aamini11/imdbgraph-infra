export GITHUB_TOKEN=$(cat ~/.github-token)
flux bootstrap github --token-auth --owner=aamini11 --repository=imdbgraph-infra --branch=main --path=kubernetes/clusters/prod --personal
flux bootstrap github --token-auth --owner=aamini11 --repository=imdbgraph-infra --branch=staging --path=kubernetes/clusters/staging --personal