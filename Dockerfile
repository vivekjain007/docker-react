# Build phase
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Production phase. Second FROM indicates start of new phase
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html


