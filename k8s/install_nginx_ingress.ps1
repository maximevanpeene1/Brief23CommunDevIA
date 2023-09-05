helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update
helm install nginx-ingress ingress-nginx/ingress-nginx --namespace my-app --create-namespace
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout myssl.key -out myssl.crt
kubectl create secret tls myssl-secret --key myssl.key --cert myssl.crt --namespace my-app