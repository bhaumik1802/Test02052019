Programming language : Python.

Application Details:
---------------------

- server.py is python application with Flask framework.
- have defined two endpoints.
  / - as HelloWorld  -- endpoint return simple "Hello World" message.
  /healthcheck - as status of the health check. - This endpoint will reture "status" dict as JSON format.
  
Dockerfile :
---------------

- dockerfile update python and install flask and dependency on top of base image (alpine)
- copy server.py to /src/server.py 
- Expose port 5002 for container 
- CMD - execute the python script on port 5002.

Docker Build:
---------------
[ec2-user@ip-172-31-6-220 test2]$ docker build -t anz_test2 .
Sending build context to Docker daemon  6.144kB
Step 1/6 : FROM alpine:3.1
 ---> a1038a41fe2b
Step 2/6 : RUN apk add --update python py-pip
 ---> Using cache
 ---> 41c5724197f0
Step 3/6 : RUN pip install flask flask-restful
 ---> Using cache
 ---> 70e561acd497
Step 4/6 : COPY server.py /src/server.py
 ---> 767a1ff3f9b1
Step 5/6 : EXPOSE 5002
 ---> Running in 788f9f4eb242
Removing intermediate container 788f9f4eb242
 ---> 0e8e3df413fa
Step 6/6 : CMD ["python", "/src/server.py", "-p 5002"]
 ---> Running in bd49f519ee94
Removing intermediate container bd49f519ee94
 ---> f1f98f97d860
Successfully built f1f98f97d860
Successfully tagged anz_test2:latest

[ec2-user@ip-172-31-6-220 test2]$ docker images

REPOSITORY                  TAG                 IMAGE ID            CREATED             SIZE
anz_test2                   latest              f1f98f97d860        8 minutes ago       54.9MB


Docker Run :
---------------
[ec2-user@ip-172-31-6-220 test2]$ docker run -idt anz_test2

f3f7651123a21ceef2f6f2d62f08755f0a7f381b0a91d709cf6b004468446622

Endpoint Results:
================
![root-endpoint](https://user-images.githubusercontent.com/46921595/52250787-90331c00-294d-11e9-9426-dcb5bdf6baa1.PNG)
![healthcheck-endpoint](https://user-images.githubusercontent.com/46921595/52250803-a214bf00-294d-11e9-9cac-4f27790366f4.PNG)

Gitlab CI integration with Github:
==================================

- I have imported the projct from github to gitlab and setup pipeline for test2.
Gitlab URL : https://gitlab.com/bhaumik1802/anztest

- .gitlab-ci.yml is defined to test and build the application.
- once application build image it will be stored in Gitlapb registry.
![gitlab-registry](https://user-images.githubusercontent.com/46921595/52250916-4ac31e80-294e-11e9-9422-4d44411f6a9f.PNG)

Deployment:
----------

- Once we have applicatiton image, use ansible-playbook for deployments.

