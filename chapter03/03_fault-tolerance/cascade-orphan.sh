# ReplicaSet 삭제
kubectl delete rs blue-replicaset

# ReplicaSet과 Pod 목록 확인
kubectl get rs
kubectl get pod

# ReplicaSet 배포
kubectl apply -f source/replicaset.yaml

# Pod Owner 정보 확인
 kubectl get pod <pod-name> -o jsonpath="{.metadata.ownerReferences[0].name}"

# Pod를 yaml 포맷으로 보기
 kubectl get pod -o yaml <pod-name>

# ReplicaSet만 삭제(orphan: 고아 전략)
kubectl delete rs blue-replicaset --cascade=orphan

# ReplicaSet과 Pod 목록 확인
kubectl get rs
kubectl get pod
