# build phase
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# run phase
# /build/app <--- all the stuff after build
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html

