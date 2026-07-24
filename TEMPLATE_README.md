# Deploy and Host Frappe HRMS on Railway

Frappe HRMS is an open-source human resources and payroll platform covering employee lifecycle management, leave, attendance, expenses, recruitment, performance, and payroll.

## About Hosting Frappe HRMS

This template pins Frappe HRMS `v16.14.0` with ERPNext `v16.29.0`. It deploys one HRMS application service plus private MariaDB and Redis services. On first boot it creates the site, installs ERPNext and HRMS, and initializes the Administrator account. Subsequent boots run `bench migrate` before starting application processes.

Frappe's standard production topology shares the `sites` directory across nginx, Gunicorn, Socket.IO, workers, and scheduler. Railway does not share volumes across services, so this template supervises those processes in one application container where they safely share one persistent volume.

## Common Use Cases

- Employee records, onboarding, transfers, and exits
- Leave, attendance, shifts, and holiday management
- Payroll, salary structures, tax slabs, and payslips
- Recruitment, appraisals, goals, and expense claims

## Dependencies for Frappe HRMS Hosting

- MariaDB 11.8 with durable storage
- Redis queue/cache with durable storage
- A comparatively high memory allocation; Frappe v16 is a substantial multi-process stack

### Deployment Dependencies

- [Frappe HRMS](https://github.com/frappe/hrms)
- [Frappe Docker](https://github.com/frappe/frappe_docker)
- [Frappe HR documentation](https://docs.frappe.io/hr/introduction)
- [Template source](https://github.com/monotykamary/railway-template-frappe-hrms)

### Implementation Details

Open the `hrms` domain and sign in as `Administrator` using the generated `ADMIN_PASSWORD` variable. The public service listens through nginx on port `8080`; `/api/method/ping` is used for health checks. MariaDB and Redis remain private. The HRMS `sites` volume and MariaDB volume receive scheduled backups.

### Why Deploy Frappe HRMS on Railway?

Railway provides private networking, persistent volumes, generated secrets, HTTPS, health checks, logs, and restart management while the template preserves the process relationships expected by Frappe.
