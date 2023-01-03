### some useful commands
# pods
kubectl get po -l tier=frontend
# services
kubectl get svc -l tier=frontend
kubectl get svc -l app=nginx-service --all-namespaces

# nodes
kubectl get no -o wide
#
kubectl delete -f myapp.yaml
