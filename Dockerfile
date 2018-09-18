FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN yarn install
COPY . .
RUN yarn build
# /app/build <---- dir for all the good stuff

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html




