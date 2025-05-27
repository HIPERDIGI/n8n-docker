#!/bin/sh

echo ">> Iniciando n8n..."

# Aguarda o banco estar disponível antes de iniciar
if [ "$DB_TYPE" = "postgresdb" ]; then
  echo ">> Aguardando conexão com o banco de dados PostgreSQL..."
  until nc -z "$DB_POSTGRESDB_HOST" "$DB_POSTGRESDB_PORT"; do
    sleep 2
  done
fi

# Inicia o n8n
exec n8n

