# 쿠버네티스에서 일어나는 이벤트를 관찰하기(--sort-by=.metadata.creationTimestamp)
kubectl get events -w

# Deployment 생성
kubectl apply -f source/deployment.yaml

# Deployment로 배포한 Pod 화면
kubectl get pod

# Deployment 배포 진행중/완료 상태 확인
kubectl rollout status deployment/my-app

# Deployment의 컨테이너 이미지와 레이블 변경 후 재배포
# --레이블 version=v2로 변경, 이미지 1.0 -> 2.0 변경
kubectl apply -f source/deployment.yaml

# ReplicaSet이 생성하는 Pod 상태 변화 확인(Watch 모드)
kubectl get rs -w

➜  ~ kubectl get rs -w
NAME                DESIRED   CURRENT   READY   AGE
my-app-7c8557f88b   5         5         5       7m45s
my-app-b77968bb     1         0         0       0s
my-app-b77968bb     1         0         0       0s
my-app-7c8557f88b   3         5         5       9m20s
my-app-b77968bb     1         1         0       0s
my-app-b77968bb     3         1         0       0s
my-app-7c8557f88b   3         5         5       9m20s
my-app-b77968bb     3         1         0       0s
my-app-b77968bb     3         3         0       0s
my-app-7c8557f88b   3         3         3       9m20s
my-app-b77968bb     3         3         1       1s
my-app-7c8557f88b   2         3         3       9m21s
my-app-7c8557f88b   2         3         3       9m21s
my-app-b77968bb     4         3         1       1s
my-app-7c8557f88b   2         2         2       9m21s
my-app-b77968bb     4         3         1       1s
my-app-b77968bb     4         4         1       1s
my-app-b77968bb     4         4         2       1s
my-app-7c8557f88b   1         2         2       9m21s
my-app-7c8557f88b   1         2         2       9m21s
my-app-b77968bb     5         4         2       1s
my-app-7c8557f88b   1         1         1       9m21s
my-app-b77968bb     5         4         2       1s
my-app-b77968bb     5         5         2       1s
my-app-b77968bb     5         5         3       3s
my-app-7c8557f88b   0         1         1       9m23s
my-app-7c8557f88b   0         1         1       9m23s
my-app-7c8557f88b   0         0         0       9m23s
my-app-b77968bb     5         5         4       6s
my-app-b77968bb     5         5         5       7s

