#!/bin/bash -l

IMAGE_NAME="$1"

curl -s https://ci-tools.anchore.io/inline_scan-v0.5.0 | bash -s -- scan -r "${IMAGE_NAME}"

# export POSTGRES_PASSWORD="${POSTGRES_PASSWORD:-mysecretpassword}"
# export ANCHORE_DB_PASSWORD="${POSTGRES_PASSWORD}"
# export ANCHORE_DB_USER="${POSTGRES_USER}"
# export ANCHORE_DB_NAME="${POSTGRES_DB}"
# export ANCHORE_DB_HOST="${ANCHORE_ENDPOINT_HOSTNAME}"
# export ANCHORE_HOST_ID="${ANCHORE_ENDPOINT_HOSTNAME}"
# export ANCHORE_CLI_URL="http://${ANCHORE_ENDPOINT_HOSTNAME}:8228/v1"
# export PATH=${PATH}:/usr/pgsql-${PG_MAJOR}/bin/
# export TIMEOUT=${TIMEOUT:=300}

# if [ -f "/opt/rh/rh-python36/enable" ]; then
#     source /opt/rh/rh-python36/enable
# fi

# if [[ ! $(pgrep anchore-manager) ]]; then
#     echo "Starting Anchore Engine"
#     gosu anchore:anchore bash -c 'nohup anchore-manager service start --all &> /var/log/anchore.log &'
# fi
    
# if [[ ! $(pg_isready -d postgres --quiet) ]]; then
#     printf '%s' "Starting Postgresql... "
#     gosu anchore:anchore bash -c 'nohup postgres &> /var/log/postgres.log &' &> /dev/null
#     sleep 3 && pg_isready -d postgres --quiet && printf '%s\n' "Postgresql started successfully!"
# fi

# if [[ ! $(curl --silent "${ANCHORE_ENDPOINT_HOSTNAME}:5000") ]]; then
#     printf '%s' "Starting Docker registry... "
#     gosu anchore:anchore bash -c 'nohup registry serve /etc/docker/registry/config.yml &> /var/log/registry.log &'
#     sleep 3 && curl --silent --retry 3 "${ANCHORE_ENDPOINT_HOSTNAME}:5000" && printf '%s\n' "Docker registry started successfully!"
# fi

# skopeo copy docker-daemon:${IMAGE_NAME} docker-archive:/anchore-engine/${IMAGE_NAME##*/}

# echo "Waiting for Anchore Engine to be available."
# # pass python script to background process & wait, required to handle keyboard interrupt when running container non-interactively.
# anchore_ci_tools.py --wait --timeout "${TIMEOUT}" &
# wait_proc="$!"
# wait "${wait_proc}"

# exec image_vuln_scan.sh -r