FROM alpine:3.1
RUN apk add --update python py-pip
RUN pip install flask flask-restful
COPY server.py /src/server.py
EXPOSE 5002 
CMD ["python", "/src/server.py", "-p 5002"]
