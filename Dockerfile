# Utiliza a imagem oficial do n8n
FROM n8nio/n8n

# Define as variáveis de ambiente diretamente no container
ENV N8N_BASIC_AUTH_ACTIVE=true \
    N8N_BASIC_AUTH_USER=admin \
    N8N_BASIC_AUTH_PASSWORD=senhaforte \
    N8N_HOST=0.0.0.0 \
    N8N_PORT=5678

# Expõe a porta utilizada pela aplicação
EXPOSE 5678

# Copia os dados da pasta local "n8n" para dentro do container
# Isso é equivalente ao volumes no docker-compose
COPY ./n8n /home/node/.n8n

# Comando para iniciar o n8n
CMD ["n8n"]
