# Use a smaller base image
FROM node:14-alpine as builder
WORKDIR /app

COPY package*.json ./

RUN npm install
COPY . .

RUN npm run build

WORKDIR /app

COPY --from=builder /app/build ./build

EXPOSE 3000

RUN npm install -g serve

CMD ["serve", "-s", "build", "-l", "3000"]