FROM openjdk:8-jre
MAINTAINER Gissehel <public-maintainer-docker-streama@gissehel.org>

EXPOSE 8080

ADD script.sh /tmp/script.sh
RUN /bin/bash /tmp/script.sh

WORKDIR /app
CMD ["java", "-Dgrails.env=prod", "-jar", "streama.war"]

