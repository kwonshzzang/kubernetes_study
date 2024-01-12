# 쿠버네티스 클러스터에서 사용할 수 있는 오브젝트 목록 조회
kubectl api-resources

# 쿠버네티스 오브젝트의 설명과 1레벨 속성들의 설명
# apiVersion kind, metadata, spec, status
kubectl explain pod
kubectl explain deployment
kubectl explain rs
kubectl explain service

# 쿠버네티스 오브젝트 속성들의 구체적인 설명(Json 경로)
# kubectl explain <type>.<fieldName>.[.<fieldName>]
kubectl explain pod.spec.containers

# 쿠버네티스 클러스터에서 속한 노드 목록 조회
kubectl get node

# 쿠버네티스 오브젝트 생성/변경
kubectl apply -f source/06_deployment.yaml

# 실행중인 Pod(컨테이너) 목록 조회
kubectl get pod
kubectl get pod -o wide
kubectl get pod -w
kubectl get pod -o yaml <pod-name>
kubectl get pod -o json <pod-name>

# 어플리케이션(pod) 배포 개수를 조정(replicas : 복제본)
kubectl scale -f source/06_deployment.yaml --replicas=3

# 현재 실행 중인 오브젝트 설정과 입력한 파일의 차이점 분석
kubectl diff -f source/06_deployment.yaml

# 쿠버네티스 오브젝트의 spec을 editor로 편집(replicas를 4로 변경)
kubectl edit deployment/nginx-deployment

# 로컬 포트는 파드에서 실행중인 컨테이너 포트로 포워딩
kubectl port-forward pod/nginx-deployment-76fdcdbfbf-7jskb 8080:80

# 현재 실행중인 컨테이너 프로세스에 접속하여 로그 확인
kubectl attach deployment/nginx-deployment

# 현재 실행중인 컨테이너 프로세스에 모든 로그 출력(-f : watch모드)
kubectl logs deployment/nginx-deployment -c nginx -f

# 쿠버네티스 오브젝트 삭제
kubectl delete deployment nginx-deployment