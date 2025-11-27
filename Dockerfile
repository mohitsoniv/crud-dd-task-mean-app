# Multi-stage build for Angular frontend
FROM node:18-alpine AS builder

WORKDIR /app

# Copy frontend directory
COPY crud-dd-task-mean-app/frontend/ .

# Install dependencies and build
RUN npm install ; npm run build --prod

# Production stage with nginx
FROM nginx:alpine

# Copy nginx config
COPY nginx/default.conf /etc/nginx/conf.d/default.conf

# Copy built Angular app from builder stage
COPY --from=builder /app/dist/angular-15-crud /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
