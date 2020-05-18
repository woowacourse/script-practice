# Shell Script를 연습하기 위한 예제

### 👨‍💻 예제 Script

예제 스크립트는 모두 aws linux 인스턴스에서 실행하길 바란다.

```bash
$ git clone https://github.com/woowacourse/script-practice
$ cd script-practice/script/
$ sudo chmod 755 ./*
```

---

#### 1. access_log_analytics.sh

- log 디렉토리의 access.log 의 데이터 통계를 내기 위한 스크립트이다.
- tail, awk 명령어의 옵션을 익힐 수 있고, 루프 등을 활용한다.
- apache 혹은 nginx의 access log를 활용하면 다양한 스크립팅 연습을 할 수 있다.
    1) HTTP 응답코드별 갯수 조회
    2) 악성유저(짧은 시간 내에 반복적으로 요청하는 유저) IP 조회
    3) geoip를 활용하여 국가별 IP 조회 

---

#### 2. aws_describe_instance.sh

```bash
$ sudo apt install awscli
```

- aws api를 활용하는 스크립트이다. 이를 활용하면 아래와 같은 추가적인 기능을 하는 스크립트도 작성이 가능하다.

    1) 정지한 EC2 instance 조회
    2) unmount된 ebs volume 조회
    3) 사용하지 않는 elastic ip 조회
    4) 특정 포트(22, 3306 등)에 대해 any open된 Security group 조회
    5) 모든 유저에 대해 S3의 read/write 권한이 오픈된 경우 조회

---

#### 3. port_scan.sh
        
```bash
$ sudo apt install nmap
$ sudo apt install dos2unix
$ cd script
$ vi iplist.txt 
# 스캔할 IP 들을 기록한다.

$ sudo ./port_scan.sh ./iplist.txt
$ ls ./result/
```

- nmap tool을 활용하며, 파라미터 전달, 표준 입/출력 제어, 파일 읽고 쓰고 삭제하기, date 함수 사용 등을 연습할 수 있다.
- server의 tool을 적극적으로 활용하여 아래와 같은 스크립트 작성도 가능하다.
    1) icmp 혹은 traceroute 정보 조회
    2) 접근 가능한 url path 조회
    3) SSL 인증서 정보 확인

---

#### 4. server_resource.sh   

```bash
$ sudo ./server_resource.sh all
```

- server의 tool을 적극적으로 활용하여 서버의 자원을 확인하는 스크립트이다.
- function 작성, grep, awk 등을 연습할 수 있으며, 서버에서 수집하는 지표를 이해할 수 있다. 따라서 아래와 같은 스크립트 작성도 가능하다.
    1) 물리 Storage 정보 조회
    2) 메모리 갯수 조회
    3) NIC 정보 조회
    4) 프로세스별 메모리 사용량 조회
    5) Routing table 조회
    6) cron 스케줄 정보 조회
    7) 방화벽 정보 조회
