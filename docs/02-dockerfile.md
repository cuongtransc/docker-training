# Dockerfile

https://docs.docker.com/engine/reference/builder/


Tag:

STOPSIGNAL

SIGTERM
SIGINT
SIGHUP
SIGQUIT

```
0 - ?
1 - SIGHUP - ?, controlling terminal closed,
2 - SIGINT - interupt process stream, ctrl-C
3 - SIGQUIT - like ctrl-C but with a core dump, interuption by error in code, ctl-/
4 - SIGILL
5 - SIGTRAP
6 - SIGABRT
7 - SIGBUS
8 - SIGFPE
9 - SIGKILL - terminate immediately/hard kill, use when 15 doesn't work or when something disasterous might happen if process is allowed to cont., kill -9
10 - SIGUSR1
11 - SIGEGV
12 - SIGUSR2
13 - SIGPIPE
14 - SIGALRM
15 - SIGTERM - terminate whenever/soft kill, typically sends SIGHUP as well?
16 - SIGSTKFLT
17 - SIGCHLD
18 - SIGCONT - Resume process, ctrl-Z (2nd)
19 - SIGSTOP - Pause the process / free command line, ctrl-Z (1st)
20 - SIGTSTP
21 - SIGTTIN
22 - SIGTTOU
23 - SIGURG
24 - SIGXCPU
25 - SIGXFSZ
26 - SIGVTALRM
27 - SIGPROF
28 - SIGWINCH
29 - SIGIO
29 - SIGPOLL
30 - SIGPWR - shutdown, typically from unusual hardware failure
31 - SIGSYS
```

## Multi Stage Dockerfile for golang application
http://pliutau.com/multi-stage-dockerfile-for-golang-application/

**[Dockerize] Multi-stage Dockerfile**

Flow:
- Compile stage: Cài đặt các thư viện, biên dịch chương trình.
- Packing stage: Copy chương trình đã được biên dịch vào image đích.

Lợi ích:
- Sử dụng được caching ở phase build -> Tăng tốc độ build.
- Chỉ đóng gói chương trình đã được biên dịch, không lấy các thư viện biên dịch -> Giảm kích thước image.

Ví dụ:
https://github.com/cuongtransc/docker-training/blob/master/images/hello-c/Dockerfile

Full post: http://pliutau.com/multi-stage-dockerfile-for-golang-application/

Tham khảo: https://eggclub.org/2017/05/17/cac-cach-build-docker-image-can-bien-dich-ma-nguon/


```Dockerfile
#--------------------------------------
# Stage: Compile Apps
#--------------------------------------
FROM golang:1.8.1

WORKDIR /go/src/github.com/plutov/golang-multi-stage/

COPY main.go .

RUN GOOS=linux go build -o app .

#--------------------------------------
# Stage: Packaging Apps
#--------------------------------------
FROM alpine:latest
RUN apk --no-cache add ca-certificates

WORKDIR /root/

COPY --from=0 /go/src/github.com/plutov/golang-multi-stage/app .

CMD ["./app"]

```




