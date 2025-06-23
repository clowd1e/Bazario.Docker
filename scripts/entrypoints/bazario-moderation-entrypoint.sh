#!/bin/bash
set -e

SCRIPT_DIR=$(dirname "$0")

echo "Waiting for RabbitMQ..."
"$SCRIPT_DIR/../wait-for-it.sh" bazario-queue:5672 -t 60
echo "RabbitMQ is ready"

echo "Starting Bazario.Moderation (HTTP 5009, HTTPS 5010)"

uvicorn main:app --host 0.0.0.0 --port 5009 &

uvicorn main:app --host 0.0.0.0 --port 5010 --ssl-keyfile /app/SSL/key.pem --ssl-certfile /app/SSL/cert.pem
