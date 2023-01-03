### some useful commands
# pods
kubectl get po -l tier=frontend
kubectl get po -o wide
# services
kubectl get svc -l tier=frontend
kubectl get svc -l app=nginx-app --all-namespaces
kubectl get svc -l app=nginx-app
kubectl delete svc nginx-service
kubectl describe svc -l app=nginx-app
# nodes
kubectl get no -o wide
kubectl describe no node01 
#
kubectl delete -f myapp.yaml
