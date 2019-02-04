### Part1

Dockerfile in its current state does not compile : Fixed Dockerfile
===================================================================

Two issues as missing dependacies:

1.  net
exec: "gcc": executable file not found in $PATH
The command '/bin/sh -c go build -o golang-test  .' returned a non-zero code: 2

2.  net
/usr/local/go/src/net/cgo_linux.go:10:19: fatal error: netdb.h: No such file or directory

I have fixed those by adding:
=============================
>>> RUN apk add git gcc musl-dev

Docker image:
[ec2-user@ip-172-31-6-220 anztest]$ docker images
REPOSITORY                  TAG                 IMAGE ID            CREATED             SIZE
anz_docker_fix              latest              4b5c87312589        10 minutes ago      482MB


### Part2 

Multi stage dockerfile :

- With multi-stage builds, you can use multiple FROM statements in your Dockerfile. Each FROM instruction can use a different base, and each of them begins a new stage of the build. You can selectively copy artifacts from one stage to another, leaving behind everything you don’t want in the final image.
- Its also very useful for example, to not include your application build dependencies in your final image, allowing you to have a much more smaller image.

Find the multi stage docker file checked-in. 

[ec2-user@ip-172-31-6-220 anztest]$ docker images
REPOSITORY                  TAG                 IMAGE ID            CREATED             SIZE
anz_docker_fix              latest              4b5c87312589        10 minutes ago      482MB

anz_multi_stage             latest              365aa6f91892        12 minutes ago      12.7MB  ######## SIZE difference 
