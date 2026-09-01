# InfluxDB v1 for Home Assistant

InfluxDB 1.8.10 packaged as a Home Assistant OS App for Raspberry Pi and other supported architectures.

## Purpose

This repository exists for Home Assistant installations that still require the InfluxDB 1.x HTTP/InfluxQL API, including BESS Manager configurations that depend on InfluxDB v1.

## Version

- InfluxDB: 1.8.10
- Home Assistant OS App format
- Architectures: `aarch64`, `armv7`
- HTTP API: port 8086
- Flux: enabled
- HTTP authentication: disabled by default for compatibility with the Home Assistant local network

## Installation

Add this repository to Home Assistant:

`https://github.com/VillaSkevik/homeassistant-addon-influxdb-v1`

Then install **InfluxDB v1** from the App store.

## Important

This is an independent community repository and is not an official Home Assistant or InfluxData product.

For production use, expose port 8086 only to trusted networks and consider enabling InfluxDB authentication once the BESS/Home Assistant configuration has been validated.
