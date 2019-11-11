FROM node:alpine as builder
#as a build phase
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
#every from statement separate block
#app/build <--- all the stuff
#run phase below use nginx
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
# we get the file name from repo

