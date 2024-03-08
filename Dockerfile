# Use a lightweight Node.js image
FROM node:18-alpine AS builder

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json (if using)
COPY package*.json ./

# Install dependencies
RUN npm install

# Build a separate slim image for production
FROM node:18-alpine

# Copy only the necessary files
COPY --from=builder /app/node_modules /app/node_modules
COPY . .

# Expose port 80
EXPOSE 80

# Start the service using the start script from package.json
CMD [ "npm", "run", "start" ]