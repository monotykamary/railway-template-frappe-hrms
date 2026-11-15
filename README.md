# Frappe HRMS on Railway

A Railway-compatible deployment of [Frappe HRMS](https://github.com/frappe/hrms), pinned to HRMS `v16.53.2` (`ba5371c5057ae90c3eb6041f28866fe3d749a4f0`) and ERPNext `v16.52.1`.

[![Deploy on Railway](https://railway.com/button.svg)](https://railway.com/deploy/frappe-hrms?referralCode=ZqgrJ0)

Railway does not support sharing one volume across independent services. The official Frappe production topology shares `sites` between backend, frontend, WebSocket, workers, and scheduler, so this template runs those application processes under Supervisor in one container while keeping MariaDB and Redis as separate private services.

## Services

- `hrms`: Frappe backend, nginx frontend, Socket.IO, short and long workers, scheduler
- `mariadb`: persistent MariaDB 13.0.2
- `redis`: persistent Redis queue/cache

The first deployment creates the `frontend` site and installs ERPNext and HRMS. Later deployments run `bench migrate` automatically.

## Updating

Keep Frappe, ERPNext, and HRMS releases compatible. HRMS v16.53.2 declares Frappe and ERPNext >=16.50.0,<17.0.0; this update retains the existing ERPNext base image and MariaDB/Redis pins. Test the in-place migration and retained application data before promoting any update.
