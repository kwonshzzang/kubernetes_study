# Service - ClusterIP 서비스로 Pod 노출하는 방법

## 실습내용1. ClusterIP 타입의 Service를 생성하여 파드집합을 단일 엔트포인트로 노출할 수 있다.
1. Service ClusterIP 생성방법
2. ClusterIP의 역할과 특징

## 실습내용2. 클러스터 내부에서 Service IP 혹은 Service 이름으로 다른 Pod와 통신할 수 있다.
1. 환경변수: Service IP로 다른 파드 집합에 접근하는 방법
2. 쿠버네티스 DNS 서버: Service 이름으로 파드 집합에 접근하는 방법
3. MSA 환경에서 다른 네임스페이스에 있는 Service를 도메인 이름으로 접근하는 방법