FROM google/cloud-sdk:alpine

RUN apk --update add openjdk8 && gcloud components install app-engine-java --quiet && apk add --no-cache curl

ENV JAVA8_HOME /usr/lib/jvm/java-1.8-openjdk
