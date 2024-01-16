# Deployment 생성
kubectl apply -f source/deployment.yaml

# Deployment의 ReplicaSet 이벤트 확인
kubectl describe deployment/my-app

# a. ReplicaSet이 생성하는 Pod 상태 변화(Watch 모드)
kubectl get rs -w

# b. Deployment를 통해 생성한 Pod 상태 변화(Watch 모드)
kubectl get deployment -w

# c. Deployment 배포 진행중/완료 상태 확인
kubectl rollout status deployment/my-app

# Deployment replicas를 5로 변경
kubectl scale deployment/my-app --replicas=5

# ReplicaSet이 생성하는 Pod 상태 변화(Watch 모드)
kubectl get rs -w

# Deployment를 통해 생성한 Pod 상태 변화(Watch 모드)
kubectl get deployment -w

# ReplicaSet의 Pod 이벤트 확인
kubectl describe rs/<replicaset-name>

# Deployment를 통해 생성한 Pod로 요청전달 및 응답확인
kubectl port-forward deployment/my-app 8080:8080

# 모든 리소스를 레이블로 삭제
kubectl delete all -l app=my-app
