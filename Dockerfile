#FROM openjdk:8-jre-alpine
FROM fiadliel/java8-jre
LABEL authors="cjr, swordfeng"
COPY course-selection-all.jar /usr/lib/course-selection/course-selection-all.jar
#COPY example.conf /usr/lib/course-selection/example.conf
WORKDIR /usr/lib/course-selection
RUN apk update && apk add libstdc++
ENTRYPOINT ["java", "-jar", "/usr/lib/course-selection/course-selection-all.jar", "-Dconfig.file=config/example.conf"]
