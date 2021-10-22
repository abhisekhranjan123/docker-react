FROM node:alpine as builder
WORKDIR '/app'
COPY package*.json ./
RUN npm install
RUN npm update
COPY . .
RUN npm run build

FROM nginx
EXPOSE 3000
COPY --from=builder /app/build /usr/share/nginx/html
