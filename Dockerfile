FROM node:14.14.0-alpine AS Builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN [ "npm", "run", "build" ]

FROM nginx
COPY --from=Builder /app/build /usr/share/nginx/html


