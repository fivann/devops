### some useful commands
# pods
kubectl get po -l tier=frontend
# services
kubectl get svc -l tier=frontend
# nodes
kubectl get no -o wide
#
kubectl delete -f myapp.yaml
