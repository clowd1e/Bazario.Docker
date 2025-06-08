#!/bin/bash
set -e

SCRIPT_DIR=$(dirname "$0")

echo "Waiting for Postgres..."
$SCRIPT_DIR/../wait-for-it.sh bazario-identity-postgres:5432 -t 60
echo "Postgres is ready"

echo "Waiting for RabbitMQ..."
$SCRIPT_DIR/../wait-for-it.sh bazario-queue:5672 -t 30
echo "RabbitMQ is ready"

echo "Starting Bazario.Identity.WebAPI..."
exec dotnet Bazario.Identity.WebAPI.dll