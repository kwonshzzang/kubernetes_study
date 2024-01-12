# ReplicaSet 생성
kubectl apply -f source/replicaset.yaml

# Pod 확인
kubectl get pod --show-labels

# Pod Template 레이블 변경
# -- env: production 추가

# 변경한 ReplicaSet 반영
kubectl apply -f source/replicaset.yaml

# Pod 확인(변경 확인)
kubectl get pod --show-labels

# Pod replica 1개 삭제
kubectl delete pod <pod_name>

# Pod과 레이블 확인
kubectl get pod --show-labels