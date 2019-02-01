Test1 :

Docker build :
==================

[ec2-user@ip-172-31-6-220 anztest]$ docker build -t anztest .
Sending build context to Docker daemon  411.6kB
Step 1/8 : FROM openjdk:9-jdk-slim as certs
 ---> 339dc16e8d08
Step 2/8 : COPY certificates /usr/local/share/ca-certificates/certificates
 ---> Using cache
 ---> 114b06bd2e49
Step 3/8 : RUN update-ca-certificates &&  chmod -R 777 /etc/ssl/certs && chmod 666 /etc/default/cacerts
 ---> Using cache
 ---> ef3ed3021d3d
Step 4/8 : FROM openjdk:9-jdk-slim
 ---> 339dc16e8d08
Step 5/8 : COPY --from=certs /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/cacertificates.crt
 ---> Using cache
 ---> bfb608ac208e
Step 6/8 : COPY --from=certs /etc/ssl/certs/java/cacerts /etc/ssl/certs/java/cacerts
 ---> Using cache
 ---> 4381744b2f94
Step 7/8 : RUN groupadd --gid 1000 java && useradd --uid 1000 --gid java --shell /bin/bash --create-home java &&  chmod -R a+w /home/java
 ---> Using cache
 ---> 78dd75595e9f
Step 8/8 : WORKDIR /home/java
 ---> Using cache
 ---> 7d432a708728
Successfully built 7d432a708728
Successfully tagged anztest:latest

Docker Run:
=================

[ec2-user@ip-172-31-6-220 anztest]$ docker run -it anztest
Feb 01, 2019 4:56:03 AM java.util.prefs.FileSystemPreferences$1 run
INFO: Created user preferences directory.
|  Welcome to JShell -- Version 9.0.4
|  For an introduction type: /help intro

jshell>

