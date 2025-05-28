#!/bin/bash
set -e

SCRIPT_DIR=$(dirname "$0")

echo "Waiting for RabbitMQ..."
$SCRIPT_DIR/../wait-for-it.sh bazario-queue:5672 -t 30
echo "RabbitMQ is ready"

echo "Starting Bazario.Notification..."
exec dotnet Bazario.Notification.dll