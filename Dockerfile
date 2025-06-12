FROM ubuntu:22.04

# Atualizar pacotes e instalar Python e pip
RUN apt update && \
    apt install -y python3 python3-pip && \
    apt clean

# Criar o diretório da aplicação e configurar permissões
RUN mkdir -p /usr/share/app

# Modificar propriedade do diretório para o usuário 1001 e grupo 0
RUN chown -R 1001:0 /usr/share/app

# Copiar o código da aplicação para o diretório de entrega
COPY . /usr/share/app

# Definir diretório de trabalho
WORKDIR /usr/share/app

# Instalar dependências do Python, incluindo Flask do requirements
RUN pip install -r requirements.txt

# Definir o usuário não root
USER 1001

# Expor a porta 5000 que Flask usa por padrão
EXPOSE 5005

# Comando para executar a aplicação Flask
CMD ["python3", "app.py"]