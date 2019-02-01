FROM openjdk:9-jdk-slim as certs
COPY certificates /usr/local/share/ca-certificates/certificates
RUN update-ca-certificates && \
 chmod -R 777 /etc/ssl/certs && chmod 666 /etc/default/cacerts
FROM openjdk:9-jdk-slim
COPY --from=certs /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/cacertificates.crt
COPY --from=certs /etc/ssl/certs/java/cacerts /etc/ssl/certs/java/cacerts
RUN groupadd --gid 1000 java &&\
 useradd --uid 1000 --gid java --shell /bin/bash --create-home java && \
 chmod -R a+w /home/java
WORKDIR /home/java

