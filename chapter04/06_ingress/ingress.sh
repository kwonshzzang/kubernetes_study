# home, order, payment, delivery Service, Deployment 생성
kubectl apply -f source/backend

# Ingress/ IngressController - Ingress 리소스를 생성하면 GKE가 구글 클라우드의 Http 로드밸런서를 이용해서 Ingress Controller 생성
# minikube addons enable ingress
# minikube service list
# minikube service order -n snackbar --url
kubectl apply -f source/ingress-multiple-hosts.yaml

# snackbar 네임스페이스에 모든 리소스 확인
kubectl get all -n snackbar

# 서비스 엔트포인트 확인
kubectl get endpoints -n snackbar

# 생성한 Ingress 리소스 확인 - ADDRESS: Ingress Controller의 IP 확인
kubectl get ingress snackbar -n snackbar

# Ingress Address와 Host 헤더 요청 실행
export INGRESS_IP=$(kubectl get ingress snackbar -n snackbar -o jsonpath="{.status.loadBalancer.ingress[0].ip}")

# === ingress multiple hosts  ===
# 주문 홈
curl -H "Host: order.fast-snackbar.com" --request GET $INGRESS_IP
