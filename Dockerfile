FROM node:18-alpine

WORKDIR /app

# instalar dependências
COPY package*.json ./
RUN npm install
RUN npm install -g nodemon

# copiar código
COPY . .

ENV PORT=4000
EXPOSE 4000

CMD ["node", "src/app.js"]
