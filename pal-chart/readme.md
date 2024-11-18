# Pal Helm Chart




testing
Verify context
```bash
kubectl config get-contexts
```

```bash
helm install --debug --dry-run pal-test ./pal-chart
```
```bash
helm install pal-test ./pal-chart
```
```bash
helm status pal-test
```
```bash
helm get all pal-test
```

```bash
kubectl port-forward svc/pal-test-pal-svc 8000:8000
kubectl port-forward svc/pal-test-pg-svc 5432:5432
```

#### If local testing (example)
```bash
kubectl port-forward svc/pal-test-ollama-svc 11434:11434
```
```bash
kubectl exec --stdin --tty pal-test-ollama-6c4bdc5599-w4n8d -- /bin/bash
```