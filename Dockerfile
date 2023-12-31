FROM postgres:latest
ARG POSTGRES_PASSWORD=wellcome
ARG POSTGRES_USER=user
ARG POSTGRES_DB=ostin
ENV POSTGRES_PASSWORD="${POSTGRES_PASSWORD}"
ENV POSTGRES_USER="${POSTGRES_USER}"
ENV POSTGRES_DB="${POSTGRES_DB}"
COPY *.csv /userfiles/
COPY init.sql /docker-entrypoint-initdb.d/init.sql
