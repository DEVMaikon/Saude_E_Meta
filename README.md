🩺 Projeto - Saúde & Meta

Tema: Aplicação de bem-estar e autocuidado (baseada em ESG - Saúde e Eficiência Pessoal﻿
).

Sprint: 2 — Integração DevOps﻿
e Deploy em Ambiente Real

🚀 1. Como executar localmente com Doker

Pré-requisitos:
Doker﻿
instalado

Node.js﻿
(opcional, se quiser rodar sem Docker﻿
)

MongoDB﻿
(local ou Atlas﻿
)

Passos:
bash

# Clonar o repositório

git clone https://github.com/DEVMaikon/Saude_E_Meta.git

cd Saude_E_Meta

# Criar arquivo .env

touch .env
Dentro do .env, coloque:

text
PORT=4000
MONGO_URI=mongodb://localhost:27017/saude_meta
JWT_SECRET=seusegredoaqui
Agora, suba o container:

bash
docker build -t saude-e-meta .
docker run -p 4000:4000 --env-file .env saude-e-meta
Depois, acesse:
👉 http://localhost:4000/api/v1/health
Deve retornar:

json
{ "status": "ok" }

🔁 2. Pipeline CI/CD﻿
Ferramenta: Render.com﻿
(Deploy Automático via GitHub﻿
)

Pipeline:

Clona o repositório no Render﻿
.

Constrói o container com base no Dockerfile﻿
.

Instala dependências e inicia o servidor Node.js﻿
.

Publica automaticamente em:
👉 https://saude-e-meta.onrender.com

Etapas do pipeline:

Build do container com Dockerfile﻿
.

Configuração automática de variáveis de ambiente.

Deploy contínuo em ambiente Production﻿
(Render﻿
).

🐳 3. Containerização
[Dokerfile]:

text
FROM node:18-alpine

WORKDIR /app

COPY package\*.json ./
RUN npm install

COPY . .

EXPOSE 4000
CMD ["node", "server.js"]
[docker-compose.yml] (opcional):

text
version: "3.9"
services:
api:
build: .
ports: - "4000:4000"
env_file: .env
depends_on: - mongo
mongo:
image: mongo:6
ports: - "27017:27017"
volumes: - mongo_data:/data/db

volumes:
mongo_data:

4. Prints do funcionamento
   ✅ Deploy ativo no Render

URL: https://saude-e-meta.onrender.com

✅ Teste de Saúde (endpoint /api/v1/health)
Retorno esperado:

json
{ "status": "ok" }
✅ Testes no Postman﻿
:

/api/v1/auth/register

/api/v1/auth/login

/api/v1/assessments

/api/v1/mood

5. Tecnologias utilizadas
   Categoria Tecnologia
   Backend Node.js (Express)﻿
   Banco de Dados MongoDB﻿
   Segurança Helmet, JWT
   Deploy Render﻿
   Controle de versão Git

- GitHub﻿
  Container Docker﻿
  CI/CD﻿
  Render Auto Deploy﻿
  Logs Morgan

6. Integrantes

Desenvolvedor: Maikon Nunes
