FROM node:20-alpine AS build
WORKDIR /myapp

copy package*.json ./
RUN npm install

copy . .
RUN npm run build

FROM nginx:alpine
COPY --from=build /app/dist /usr/share/nginx/html

EXPOSE 80
CMD["nginx","-g","daemon off;"]
