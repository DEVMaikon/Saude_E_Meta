# Saúde & Meta

Aplicação de bem-estar e autocuidado com foco em acompanhamento de hábitos, humor e avaliações pessoais.

O projeto combina uma aplicação iOS desenvolvida em **Swift** com uma camada backend em **Node.js/Express**, persistência em **MongoDB**, autenticação com **JWT**, containerização com **Docker** e deploy automatizado.

---

## 🚀 Visão Geral

O Saúde & Meta foi desenvolvido como uma solução voltada a bem-estar e autocuidado, utilizando conceitos de saúde, acompanhamento pessoal e evolução de metas.

A aplicação contempla recursos como:

- autenticação de usuários;
- registro e login;
- avaliações;
- acompanhamento de humor;
- API REST;
- persistência de dados;
- containerização;
- deploy em ambiente real.

---

## 🧩 Arquitetura

A solução é composta por duas camadas principais:

```text
Aplicação iOS
   ↓
Swift
   ↓
API REST
   ↓
Node.js + Express
   ↓
MongoDB
```

### Front-End Mobile

A aplicação mobile foi desenvolvida em **Swift**, responsável pela experiência do usuário no ambiente iOS.

### Back-End

O backend utiliza:

- Node.js
- Express
- MongoDB
- JWT
- Helmet
- Morgan

A API é responsável por autenticação, regras de negócio e persistência dos dados.

---

## 🛠️ Tecnologias Utilizadas

### Mobile

- Swift
- iOS

### Back-End

- Node.js
- Express
- REST API
- JWT
- Helmet
- Morgan

### Banco de Dados

- MongoDB

### DevOps

- Docker
- Docker Compose
- Git
- GitHub
- CI/CD
- Render

---

## 🔐 Segurança

A API utiliza:

- autenticação baseada em JWT;
- Helmet para reforço de segurança HTTP;
- variáveis de ambiente para informações sensíveis;
- separação de configurações por ambiente.

Exemplo de configuração:

```env
PORT=4000
MONGO_URI=mongodb://localhost:27017/saude_meta
JWT_SECRET=seusegredoaqui
```

O arquivo `.env` não deve ser versionado.

---

## 🐳 Executando com Docker

### Pré-requisitos

- Docker
- Docker Compose
- Git

Clone o repositório:

```bash
git clone https://github.com/DEVMaikon/Saude_E_Meta.git
```

Entre no projeto:

```bash
cd Saude_E_Meta
```

Crie o arquivo `.env` na raiz.

Exemplo:

```env
PORT=4000
MONGO_URI=mongodb://localhost:27017/saude_meta
JWT_SECRET=seusegredoaqui
```

Construa a imagem:

```bash
docker build -t saude-e-meta .
```

Execute o container:

```bash
docker run -p 4000:4000 --env-file .env saude-e-meta
```

---

## 🐳 Docker Compose

O projeto também possui configuração com Docker Compose.

Exemplo de estrutura:

```yaml
version: "3.9"

services:
  api:
    build: .
    ports:
      - "4000:4000"
    env_file:
      - .env
    depends_on:
      - mongo

  mongo:
    image: mongo:6
    ports:
      - "27017:27017"
    volumes:
      - mongo_data:/data/db

volumes:
  mongo_data:
```

---

## 🔄 CI/CD e Deploy

O projeto possui fluxo de deploy automatizado utilizando **Render**.

Fluxo:

```text
GitHub
   ↓
Build
   ↓
Docker
   ↓
Render
   ↓
Deploy
```

O processo inclui:

- clonagem do repositório;
- build da aplicação;
- instalação de dependências;
- configuração de variáveis de ambiente;
- publicação automática.

---

## 🌐 Health Check

A API disponibiliza um endpoint de saúde:

```http
GET /api/v1/health
```

Retorno esperado:

```json
{
  "status": "ok"
}
```

---

## 🧪 Endpoints Utilizados em Testes

Entre os endpoints utilizados estão:

```http
POST /api/v1/auth/register
POST /api/v1/auth/login
GET /api/v1/assessments
GET /api/v1/mood
```

Os fluxos foram testados utilizando Postman.

---

## 📁 Estrutura do Repositório

A estrutura principal inclui:

```text
.github/
└── workflows/

SaudeEMeta/

Dockerfile
docker-compose.yml
docker-compose.staging.yml
docker-compose.prod.yml
README.md
```

A presença de arquivos separados para staging e production permite organizar diferentes ambientes de execução.

---

## 📌 Práticas Aplicadas

- Arquitetura cliente-servidor
- API REST
- Autenticação JWT
- Variáveis de ambiente
- Containerização
- Docker Compose
- CI/CD
- Deploy automatizado
- Separação de ambientes
- Testes de endpoints
- Versionamento com Git

---

## 🗺️ Roadmap

Próximas evoluções possíveis:

- [ ] Ampliar cobertura de testes automatizados
- [ ] Documentar API com Swagger / OpenAPI
- [ ] Melhorar observabilidade e logs
- [ ] Adicionar tratamento global de erros
- [ ] Criar testes de integração
- [ ] Melhorar integração entre aplicativo iOS e backend
- [ ] Evoluir estratégia de CI/CD
- [ ] Adicionar monitoramento do ambiente publicado

---

## 📚 Contexto do Projeto

O projeto foi desenvolvido como parte de uma atividade acadêmica com foco em integração entre desenvolvimento, DevOps e deploy em ambiente real.

Além da implementação funcional, o projeto foi utilizado para praticar:

- desenvolvimento mobile;
- APIs;
- banco de dados;
- autenticação;
- Docker;
- CI/CD;
- deploy;
- organização de ambientes.

---

## 👨‍💻 Autor

**Maikon Nunes**

Full Stack Developer

**LinkedIn:**  
linkedin.com/in/maikonnunes

**GitHub:**  
github.com/DEVMaikon
