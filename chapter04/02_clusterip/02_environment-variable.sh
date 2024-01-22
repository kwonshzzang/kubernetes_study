# 환경변수를 이용한 Service 호출

# snackbar 네임스페이스 생성
kubectl create namespace snackbar

# Service, Deployment 배포(service.yaml)
kubectl apply -f source/service.yaml

# snackbar 네임스페이스의 모든 리소스 조회
kubectl get all -n snackbar

# order 컨테이너 환경변수 확인
kubectl exec <order-pod-name> [-c <container-name>] -n snackbar -- env | grep PAYMENT

# payment 컨테이너 환경변수 확인
kubectl exec <payment-pod-name> [-c <container-name>] -n snackbar -- env | grep ORDER

# snackbar 네임스페이스의 order Pod의 컨테이너 쉘 접속
kubectl exec -it <order-pod-name> [-c <container-name>] -n snackbar -- sh

# 컨테이너내에서 서비스 환경변수를 이용하여 Payment 호출
curl $PAYMENT_SERVICE_HOST:$PAYMENT_PAYMENT_SERVICE_PORT

# payment 서비스의 로드밸런싱 확인
for i in `seq 1 10`; do curl -s $PAYMENT_SERVICE_HOST:$PAYMENT_SERVICE_PORT; done
