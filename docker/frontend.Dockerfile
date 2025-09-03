# --- Build stage ---
FROM node:18-alpine AS build
WORKDIR /app
COPY frontend/package.json frontend/jest.config.js ./
RUN npm ci
COPY frontend/src ./src
RUN npm run build
# --- Runtime stage ---
FROM nginx:1.27-alpine
COPY --from=build /app/dist/ /usr/share/nginx/html/
EXPOSE 80
CMD ["nginx","-g","daemon off;"]
