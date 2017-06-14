#FROM openjdk:8-jre-alpine
FROM fiadliel/java8-jre
MAINTAINER cjr
COPY course-selection-all.jar /usr/lib/course-selection/course-selection-all.jar
RUN apk update && apk add libstdc++
CMD ["java", "-cp", "/usr/lib/course-selection/course-selection-all.jar", "moe.taiho.course_selection.cluster.WebServer", "2>&1", ">/var/log/http-actor.log"]
