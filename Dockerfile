FROM node:alpine as builder

WORKDIR '/app'
COPY package.json .
RUN  npm install

COPY . .
RUN yarn build

#previous block is done, when a new from is here
FROM nginx
#from a different phase : in this case is a builder phase
COPY --from=builder /app/build /usr/share/nginx/html

 



