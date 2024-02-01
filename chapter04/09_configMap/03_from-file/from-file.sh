# 파일로부터 ConfigMap을 생성하고 파드 컨테이너 환경변수로 전달하기(envFrom)

# greeting-config-from-file라는 ConfigMap에 저장할 key와 value를 configs/ 디렉토리에 생성한다.
# 환경변수 key: STUDENT_NAME, MESSAGE
# 환경변수 value: 권순현, 안녕
# ConfigMap은 파일 이름을 key로, 파일 내용을 value로 설정한다.

# hello-app 파드 선언시 envFrom 속성을 사용해서 greeting-config-from-file라는 ConfigMap 참조

#      envFrom:
#        - configMapRef:
#            name: greeting-config-from-file
#      env:
#        - name: GREETING
#          value: $(MESSAGE)! $(STUDENT_NAME)

# 파일로부터 ConfigMap 생성
kubectl create configmap greeting-config-from-file --from-file=source/configs

# ConfigMap 확인
kubectl get configmap greeting-config-from-file -o yaml

#apiVersion: v1
#data:
#  MESSAGE: 안녕
#  STUDENT_NAME: 권순현
#kind: ConfigMap
#metadata:
#  creationTimestamp: "2024-02-01T07:41:45Z"
#  name: greeting-config-from-file
#  namespace: default
#  resourceVersion: "871631"
#  uid: f11932b2-169d-4b14-ba25-86739089aa95

# hello-app 파드 생성
kubectl apply -f source/hello-app.yaml

# Pod 확인
kubectl get pod

# 환경변수 GREETING 출력 확인 - 포트포워딩 8080:8080
kubectl port-forward hello-app 8080:8080

# 웹브라우저를 통해 확인
localhost:8080

# 파드삭제
kubectl delete pod hello-app
