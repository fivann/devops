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
#

kubectl get deployments -n ingress-nginx -o wide
kubectl get services -n ingress-nginx
# only name:
kubectl get services -n ingress-nginx --output=jsonpath='{.items[*].metadata.name}'
kubectl describe deployment nginx-ingress-controller -n ingress-nginx
# to run command in pod:
# get a pod:
kubectl get po -n ingress-nginx
# and run
kubectl exec nginx-ingress-controller-65886f4f5d-489ks -n ingress-nginx -it -- nginx -v
kubectl exec nginx-ingress-controller-65886f4f5d-489ks -n ingress-nginx -it -- /bin/bash
# use the -c flag to specify the container in which to run the command
kubectl exec nginx-ingress-controller-65886f4f5d-489ks -n ingress-nginx -c nginx-ingress-controller -it -- curl http://localhost > output.txt
kubectl exec nginx-ingress-controller-65886f4f5d-xgdxs -n ingress-nginx -it -- nginx -v
#
# ingress
kubectl get ing
kubectl describe ingress aqua-ingress
