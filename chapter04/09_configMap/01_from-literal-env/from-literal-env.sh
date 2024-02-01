# 리터럴 방식으로 ConfigMap을 생성하고 파드 컨테이너 환경변수로 전달하기

# ConfigMap 생성
kubetl create configmap greeting-config --from-literal=STUDENT_NAME=권순현 --from-literal=MESSAGE=안녕

# 생성한 ConfigMap 확인
kubetl get configmap greeting-config -o yaml

# hello-app 파드 선언 시 greeting-config라는 ConfigMap을 사용해서 환경변수 설정
# 환경변수: 1) STUDENT_NAME 2) MESSAGE 3) GREETING(STUDENT_NAME과 MESSAGE 조합)

#      env:
#        - name: STUDENT_NAME
#          valueFrom:
#            configMapKeyRef:
#              name: greeting-config
#              key: STUDENT_NAME
#        - name: MESSAGE
#          valueFrom:
#            configMapKeyRef:
#              name: greeting-config
#              key: MESSAGE
#        - name: GREETING
#          value: $(MESSAGE)! $(STUDENT_NAME)

# hello-app 파드 생성
kubetl apply -f source/hello-app.yaml

# Pod 확인
kubetl get pod

# 환경변수 GREETING 출력 확인- 포트포워딩 8080:8080
kubetl port-forward hello-app 8080:8080

# 웹브라우저를 통해 확인
localhost:8080

# 파드삭제
kubectl delete pod hello-app