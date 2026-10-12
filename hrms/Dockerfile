FROM docker.io/frappe/erpnext:v16.50.0@sha256:ac5b4591e80b52d2e22f6f5cad5d5e7e300f9764dbfeb3f92d325e86baede08d

USER root
RUN apt-get update \
    && apt-get install -y --no-install-recommends supervisor \
    && rm -rf /var/lib/apt/lists/*

USER frappe
WORKDIR /home/frappe/frappe-bench
RUN bench get-app --branch v16.50.0 https://github.com/frappe/hrms \
    && bench build \
    && grep -Fq '"website.bundle.css"' sites/assets/assets.json \
    && grep -Fq '"erpnext-web.bundle.css"' sites/assets/assets.json \
    && grep -Fq '"hrms.bundle.css"' sites/assets/assets.json \
    && rm -rf /home/frappe/frappe-bench/assets \
    && cp -r /home/frappe/frappe-bench/sites/assets /home/frappe/frappe-bench/assets

USER root
COPY entrypoint.sh /usr/local/bin/hrms-entrypoint
COPY supervisord.conf /etc/supervisor/conf.d/hrms.conf
RUN chmod 755 /usr/local/bin/hrms-entrypoint

ENV PORT=8080
EXPOSE 8080
ENTRYPOINT ["/usr/local/bin/hrms-entrypoint"]
