FROM docker.io/frappe/erpnext:v16.36.0@sha256:295574c6a112d790a1a16f8c8c8ec3b987b6c8e235818bfd14f0fccaf1db7672

USER root
RUN apt-get update \
    && apt-get install -y --no-install-recommends supervisor \
    && rm -rf /var/lib/apt/lists/*

USER frappe
WORKDIR /home/frappe/frappe-bench
RUN bench get-app --branch v16.20.0 https://github.com/frappe/hrms \
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
