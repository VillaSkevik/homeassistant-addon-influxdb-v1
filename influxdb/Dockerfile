FROM influxdb:1.8.10

RUN apt-get update \
    && apt-get install -y --no-install-recommends ca-certificates curl tar \
    && rm -rf /var/lib/apt/lists/* \
    && curl -fsSL https://dl.influxdata.com/chronograf/releases/chronograf-1.10.6_linux_arm64.tar.gz -o /tmp/chronograf.tar.gz \
    && tar -xzf /tmp/chronograf.tar.gz -C /tmp \
    && cp /tmp/chronograf-1.10.6-1/usr/bin/chronograf /usr/local/bin/chronograf \
    && chmod +x /usr/local/bin/chronograf \
    && rm -rf /tmp/chronograf* \
    && mkdir -p /data/influxdb /data/chronograf

ENV INFLUXDB_REPORTING_DISABLED=true
ENV INFLUXDB_HTTP_AUTH_ENABLED=false
ENV INFLUXDB_HTTP_FLUX_ENABLED=true
ENV INFLUXDB_DATA_DIR=/data/influxdb/data
ENV INFLUXDB_META_DIR=/data/influxdb/meta
ENV INFLUXDB_DATA_WAL_DIR=/data/influxdb/wal

COPY run.sh /run.sh
RUN chmod +x /run.sh

ENTRYPOINT ["/run.sh"]
