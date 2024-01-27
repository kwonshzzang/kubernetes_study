# Service - NodeBalancer 서비스로 Pod 노출하는 방법

## 실습내용1. NodeBalancer 타입의 Service를 생성하여 파드집합을 단일 엔트포인트로 노출할 수 있다.
1. Service NodeBalancer 생성방법
2. NodeBalancer 역할과 특징

## 실습내용2. 클러스터 외부에서 할당된 External IP와 NodePort를 통해 통신할 수 있다.
1. 외부에서 접근할 수 있는 External IP와 NodePort를 할당 받음
2. 할당받은 External IP와 노드 Port를 통해 들어온 트래픽을 파드 집합으로 포워딩함