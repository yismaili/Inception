#!/bin/bash
sed -i "s/etc\/ssl\/certs\/nginx.crt/${certs_crt}/g" "/etc/nginx/sites-enabled/default"
sed -i "s/etc\/ssl\/private\/nginx.key/${private_key}/g" "/etc/nginx/sites-enabled/default"
exec "$@"