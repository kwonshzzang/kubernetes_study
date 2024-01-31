# LoadBalancer 타입의 서비스 생성
kubectl apply -f source/service.yaml

# 서비스 External IP 확인
kubectl get svc -w

# 서비스 엔트포인트를 환경변수 SERVICE로 저장
export SERVICE=$(kubectl get svc myapp -o jsonpath="{.status.loadBalancer.ingress[0].ip}")

# healthy, unhealthy 파드 생성
kubectl apply -f source/pod-readinessProbe-probe.yaml

# 서비스 엔트포인트를 관찰
kubectl get endpoints -w

#Events:
#  Type     Reason     Age                From               Message
#  ----     ------     ----               ----               -------
#  Normal   Scheduled  2m1s               default-scheduler  Successfully assigned default/healthy to minikube
#  Normal   Pulled     2m1s               kubelet            Container image "yoonjeong/healthy-app:1.0" already present on machine
#  Normal   Created    2m1s               kubelet            Created container healthy
#  Normal   Started    2m1s               kubelet            Started container healthy
#  Warning  Unhealthy  1s (x20 over 91s)  kubelet            Readiness probe failed: ls: server.rs: No such file or directory
kubectl describe pod/healthy


# 서비스 엔드포인트로 요청 실행
for i in {0..5};
do curl -v $SERVICE;
done

# unhealthy 파드에 접속하여 /var/ready 디렉토리 생성
kubectl exec =it unhealthy -- mkdir /var/ready

# 서비스 엔트포인트, 파드 READY 상태를 관찰

# 서비스, 파드 삭제
kubectl delete all -l app=myapp