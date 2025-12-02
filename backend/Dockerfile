# Backend Dockerfile
FROM node:18-alpine

WORKDIR /app

# Copy backend package files
COPY backend/package*.json ./

# Install production dependencies only
ENV NODE_ENV=production
RUN npm install --omit=dev && npm cache clean --force

# Copy backend source
COPY backend/ .

# Create non-root user and switch
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser

# Expose port used by server.js
EXPOSE 8080

CMD ["node", "server.js"]
