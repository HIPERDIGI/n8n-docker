FROM node:18-slim

# Define diretório de trabalho
WORKDIR /usr/local/n8n

# Instala dependências do projeto
COPY package*.json ./
RUN npm install --legacy-peer-deps && npm cache clean --force

# Copia todos os arquivos do projeto
COPY . .

# Cria diretório para configurações e arquivos do usuário
RUN mkdir /root/.n8n && chmod -R 700 /root/.n8n

# Expõe a porta padrão do n8n
EXPOSE 5678

# Define variáveis padrão (podem ser sobrescritas no Render)
ENV GENERIC_TIMEZONE="America/Sao_Paulo" \
    N8N_PORT=5678 \
    N8N_BASIC_AUTH_ACTIVE=true \
    N8N_BASIC_AUTH_USER=admin \
    N8N_BASIC_AUTH_PASSWORD=admin \
    N8N_ENCRYPTION_KEY=mysecretkey \
    DB_TYPE=postgresdb \
    DB_POSTGRESDB_PORT=5432

# Usa o entrypoint
ENTRYPOINT ["/bin/sh", "-c", "./entrypoint.sh"]

