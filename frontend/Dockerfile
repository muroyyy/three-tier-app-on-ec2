# frontend/Dockerfile

FROM node:18-alpine

WORKDIR /app
COPY . .
RUN npm install
RUN npm run build

# Serve using a simple web server (e.g., serve)
RUN npm install -g serve
CMD ["serve", "-s", "build"]
