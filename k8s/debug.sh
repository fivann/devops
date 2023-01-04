kubectl version --short
# pod is in CrashLoopBackOff status, how to debug
kubectl get po --all-namespaces
# smth like
# default         nginx-ingress-controller-66f656b54b-h8b4l   0/1     CrashLoopBackOff   4          2m32s
kubectl logs [pod-name]
kubectl logs nginx-ingress-controller-66f656b54b-h8b4l
# smth like 
# ✖ The cluster seems to be running with a restrictive Authorization mode and the Ingress controller does not have the required permissions to operate normally.
# It looks like the cluster is running with a restrictive authorization mode and the Ingress controller does not have the necessary permissions to operate correctly. To fix this issue, you will need to give the Ingress controller the necessary permissions to operate.
# One way to do this is to use a ClusterRole and ClusterRoleBinding to grant the Ingress controller the necessary permissions.

kubectl exec nginx-ingress-controller-65886f4f5d-xgdxs -n ingress-nginx -it -- cat /etc/nginx/nginx.conf | nl | grep access_logymc
