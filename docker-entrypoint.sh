#!/bin/bash
set -euo pipefail

echo "HOST: $POSTGRES_HOSTNAME"

config=" --config:postgresql.hostname=$POSTGRES_HOSTNAME"
config="$config --config:postgresql.user=$POSTGRES_USER"
config="$config --config:postgresql.password=$POSTGRES_PASSWORD"
config="$config --config:postgresql.database=$POSTGRES_DB"
config="$config --config:postgresql.port=$POSTGRES_PORT"

config="$config --config:crypto.hash.key=$HASH_KEY"
config="$config --config:crypto.cipher.key=$CIPHER_KEY"

# echo $config

.build/release/Run serve $config
