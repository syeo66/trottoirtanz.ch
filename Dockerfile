FROM node:20 as node
WORKDIR /usr/src/app
COPY package*.json .
COPY yarn.lock .
RUN yarn
COPY . .
RUN yarn build 

FROM nginx as server

EXPOSE 80

ENV REDEPLOY 2

COPY --from=node /usr/src/app/dist /usr/share/nginx/html

