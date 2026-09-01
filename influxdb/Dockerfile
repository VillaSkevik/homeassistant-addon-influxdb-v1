ARG BUILD_FROM=ghcr.io/home-assistant/aarch64-base:latest
FROM influxdb:1.8.10

ENV INFLUXDB_REPORTING_DISABLED=true
ENV INFLUXDB_HTTP_AUTH_ENABLED=false
ENV INFLUXDB_HTTP_FLUX_ENABLED=true

COPY run.sh /run.sh
RUN chmod a+x /run.sh

ENTRYPOINT ["/run.sh"]
