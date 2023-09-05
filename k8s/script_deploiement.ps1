#namespace
kubectl apply -f namespace.yaml

#variables env
kubectl apply -f config.yaml -n my-app
kubectl apply -f secret.yaml -n my-app
kubectl create configmap nginx-config --from-file=nginx.conf


#persistentVolume
kubectl apply -f postgres-pv-pvc.yaml -n my-app
kubectl apply -f elasticsearch-pv-pvc.yaml -n my-app

#database services
kubectl apply -f services.yaml -n my-app
kubectl apply -f ingress.yaml -n my-app

#database
kubectl apply -f postgres-deployment.yaml -n my-app
kubectl apply -f adminer-deployment.yaml -n my-app
kubectl apply -f elasticsearch-deployment.yaml -n my-app
kubectl apply -f reverseproxy-deployment.yaml -n my-app

#web
kubectl apply -f web-deployment.yaml -n my-app