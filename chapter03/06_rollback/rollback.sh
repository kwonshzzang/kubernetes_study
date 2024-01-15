# v2 이미지를 배포하기 위한 ReplicaSet 생성
kubectl apply -f source/replicaset.yaml

# Pod 목록과 app 레이블 확인
kubectl get pod -L app

# ReplicaSet과 Pod Template 확인
kubectl get rs myapp-replicaset -o wide

# 포트포워딩 8080 -> 8080(ReplicaSet에 의해 생성된 파드로 트래픽 전달)
kubectl port-forward rs/myapp-replicaset 8080:8080

# 5번 요청 실행
for i in {0..5};
do curl -vs localhost:8080;
done

# Replicaset의 my-app 컨테이너 이미지를 이전 버전(1.0)으로 변경 - 롤백준비
kubectl set image rs/myapp-replicaset my-app=yoonjeong/my-app:1.0

# ReplicaSet과 Pod Template 확인
kubectl get rs myapp-replicaset -o wide

# Pod의 Owner 확인
kubectl get pod <pod-name> -o jsonpath="{.metadata.ownerReferences[0].name}"

# 실행 중인 2.0 버전의 모든 Pod 레이블 변경
kubectl label pod <pod-name> app=to-be-fixed --overwite
kubectl label pod <pod-name> app=to-be-fixed --overwite
kubectl label pod <pod-name> app=to-be-fixed --overwite

# 레이블 변경한 Pod owner 확인
kubectl get pod <pod_name> -o jsonpath="{.metadata.ownerReferences[0].name}"

# ReplicaSet 확인(배포 이미지 변경됨)
kubectl get rs rs/myapp-replicaset -o wide

# Pod 목록 확인
kubectl get pod --show-labels

# ReplicaSet 이벤트 확인
kubectl describe rs my-replicaset

# Pod 다시 정렬을 위해 ReplicaSet의 스케일 0 -> 3으로
kubectl scale rs/myapp-replicaset --replicas 0
kubectl scale rs/myapp-replicaset --replicas 3

# Pod 목록 확인
kubectl get pod --show-labels

# 포트포워딩 8080->8080(ReplicaSet에 의해 생성된 파드로 트래픽 전달)
kubectl port-forwrd rs/myapp-replicaset 8080:8080

# 요청실행
curl localhost:8080

# ReplicaSet 스케일 0으로 조정
kubectl scale rs/myapp-replicaset --replicas 0

# ReplicaSet 삭제
kubectl delete rs/myapp-replicaset
