FROM mysql:8.0.25

ENV MYSQL_DATABASE course

#ENV MYSQL_ALLOW_EMPTY_PASSWORD yes
ENV MYSQL_ROOT_PASSWORD 123456789

COPY ./course.sql /docker-entrypoint-initdb.d/