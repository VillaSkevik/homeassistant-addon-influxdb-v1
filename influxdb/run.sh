#!/bin/sh
set -eu

mkdir -p /data/influxdb/data /data/influxdb/meta /data/influxdb/wal /data/chronograf

influxd &
INFLUX_PID=$!

# Wait until InfluxDB is accepting HTTP requests.
for i in $(seq 1 60); do
  if curl -fsS http://127.0.0.1:8086/ping >/dev/null 2>&1; then
    break
  fi
  sleep 1
done

chronograf \
  --host 0.0.0.0 \
  --port 8888 \
  --influxdb-url http://127.0.0.1:8086 \
  --bolt-path /data/chronograf/chronograf-v1.db &
CHRONOGRAF_PID=$!

trap 'kill "$CHRONOGRAF_PID" "$INFLUX_PID" 2>/dev/null || true; wait' INT TERM EXIT

wait "$INFLUX_PID"
