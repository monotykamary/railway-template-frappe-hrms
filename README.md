# Frappe HRMS on Railway

A Railway-compatible deployment of [Frappe HRMS](https://github.com/frappe/hrms), pinned to HRMS `v16.16.0` and ERPNext `v16.31.1`.

[![Deploy on Railway](https://railway.com/button.svg)](https://railway.com/deploy/frappe-hrms?referralCode=ZqgrJ0)

Railway does not support sharing one volume across independent services. The official Frappe production topology shares `sites` between backend, frontend, WebSocket, workers, and scheduler, so this template runs those application processes under Supervisor in one container while keeping MariaDB and Redis as separate private services.

## Services

- `hrms`: Frappe backend, nginx frontend, Socket.IO, short and long workers, scheduler
- `mariadb`: persistent MariaDB 11.8.8
- `redis`: persistent Redis queue/cache

The first deployment creates the `frontend` site and installs ERPNext and HRMS. Later deployments run `bench migrate` automatically.

## Updating

Update and test the ERPNext base image and HRMS release together. Frappe application versions must remain compatible.
