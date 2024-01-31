# livenessProbe 선언

# 파드 생성
 kubectl apply -f source/pod-liveness-probe.yaml

# 서비스 엔트포인트를 관찰
kubectl get endpoints -w

# 파드 STATUS와 RESTARTS를 관칠, 몇초가 흐른 뒤...(CrashLoopBackOff 상태(컨테이너가 반복적으로 실패함)가 되었을 때 엔드포인트에서 제거된다)
kubectl get pod -w

# Pod 이벤트를 확인하여 문제 원인 확인
#NAME        READY   STATUS    RESTARTS      AGE
#healthy     1/1     Running   3 (22s ago)   2m26s
#unhealthy   1/1     Running   3 (15s ago)   2m26s
#healthy     1/1     Running   4 (1s ago)    2m39s
#unhealthy   1/1     Running   4 (1s ago)    2m47s
#healthy     0/1     CrashLoopBackOff   4 (0s ago)    3m14s
#unhealthy   0/1     CrashLoopBackOff   4 (0s ago)    3m20s
#unhealthy   1/1     Running            5 (44s ago)   4m4s
#healthy     1/1     Running            5 (52s ago)   4m6s
#unhealthy   0/1     CrashLoopBackOff   5 (1s ago)    4m38s
#healthy     1/1     Running            6 (1s ago)    4m42s
#healthy     0/1     CrashLoopBackOff   6 (1s ago)    5m15s
#unhealthy   1/1     Running            6 (88s ago)   6m5s
#unhealthy   0/1     CrashLoopBackOff   6 (0s ago)    6m38s

# Pod 이벤트를 확인하여 문제 원인 확인
## State: 현재 컨테이너 실행 상태
## Last State: Terminated - 이전 컨테이너가 실행을 시작한 다음 어떤 이유로 실패해서 종료되었다
## 파드 상태가 CrashLoopBackOff 일 때 Conditions
#   Type              Status
#   Initialized       True
#   Ready             False
#   ContainersReady   False
#   PodScheduled      True
kubectl describe pod/unhealthy
