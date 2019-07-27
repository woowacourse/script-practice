## Linux 명령어

```
명령어의 메뉴얼을 확인
# man [명령어]  

# 디렉터리 이동
# cd [디렉터리 경로]
  cd ../ 

# 디렉터리 생성
# mkdir [디렉터리 명]

# 하위경로까지 복제
# cp -R [디렉터리 경로]

# 복제 및 rename
# mv [Source] [Dest]

# 삭제
# rm -rf

# 파일 내용 표준 출력
# cat 

# 현재 경로의 파일들(숨김파일 포함)의 정보를 출력
# ls -al

# 명령어 이력 확인
# history

https://ko.wikipedia.org/wiki/Kill
# kill

실시간으로 파일의 변경되는 사항을 출력
# tail -f

파일이름으로 파일 찾기 및 경로 업데이트 
# sudo updatedb
# locate

현재 작업중인 디렉터리의 이름 
# pwd

Archiving 압축하기, 압축풀기
# tar -xvf [압축파일명]
# tar -cvf [파일명] [압축할파일 또는 디렉터리]

# chown [소유자계정명]:[소유그룹명] [file이름] 
  ex) chown testuser:testgroup testfile

https://ko.wikipedia.org/wiki/Chmod
# chmod 

https://ko.wikipedia.org/wiki/Sudo
# sudo

명령어 위치 확인
# which [명령어]

/etc/fstab 파일에 정의된 모든파일 시스템을 mount
# mount -a

# du -h : 하위디렉토리까지 표현
# du -sh : 해당 디렉토리만 표현
# du -ah : 파일에 대한 정보도 표현
# df -h : 파일 시스템별 가용공간 확인

# find ./* -name "*java"
# find . -type f -user root \( -perm 4000 -o -perm -2000 \) -exec ls -al {} \;
# find . -type f -mtime -2 -exec ls -al {} \;
# find . -type f -size 3M -exec ls -al {} \;

# 프로세스 스케줄 관리
# crontab -l : list crontab 
# crontab -e : edit crontab
# vi /etc/crontab : 특정 사용자 권한으로 실행이 가능

```

#### Trouble Shooting

```
# iptables -nL
# ping -c 5 -s 128 www.google.com  (c : 패킷 수, s : 패킷 사이즈)
# top
# netstat -antp | grep 8080
# ps -auxfg
# ps -ef 
# ps -eo user,pid,ppid,rss,size,vsize,pmem,pcpu,time,cmd --sort -rss | head -n 11
# ip route
# nslookup
# telnet
# uptime
# free -m

https://b.luavis.kr/server/linux-performance-analysis
$ sudo apt install sysstat
```