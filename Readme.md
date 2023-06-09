Build Steps
1. Test
```
python manage.py test
```

2. Build tawi_server 
```
docker build -t registry.digitalocean.com/tawi-container-registry/tawi_server:latest nginx/
```
3. Build tawi_api
```
docker build -t registry.digitalocean.com/tawi-container-registry/tawi_api:latest api/
```
4. Push tawi_api image to registry
```
docker push registry.digitalocean.com/tawi-container-registry/tawi_api --all-tags
```
5. Push tawi_server image to registry
```
docker push registry.digitalocean.com/tawi-container-registry/tawi_server --all-tags
```
6. Update secrets
```
kubectl delete secrets tawi-prod-env-secrets
```
```
kubectl create secret generic tawi-prod-env-secrets --from-env-file ./.env.prod
```
7. Apply all deployments and services
```
kubectl apply -f k8s/tawi_api.yaml 
```
```
kubectl apply -f k8s/tawi_server.yaml 
```
8. Rollout and Monitor Deployments
```
kubectl rollout restart deployment/tawi-api-deployment
```
```
kubectl rollout status deployment/tawi-api-deployment
```
kubectl rollout restart deployment/tawi-server-deployment
```
kubectl rollout status deployment/tawi-server-deployment
```
-- also check 
```
kubectl get pods
```

and 
```
kubectl set image deployment/tawi-api-deployment tawi-api=registry.digitalocean.com/tawi-container-registry/tawi_api:${GITHUB_SHA::7}
```
```
kubectl set image deployment/tawi-server-deployment tawi-server=registry.digitalocean.com/tawi-container-registry/tawi_server:${GITHUB_SHA::7}
```

### Github Actions Docs
https://docs.github.com/en/actions/using-workflows/workflow-syntax-for-github-actions

