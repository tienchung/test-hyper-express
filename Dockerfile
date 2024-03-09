# Use a lightweight Node.js image for building
FROM node:18 AS builder

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json (if using)
COPY package*.json ./

# Install dependencies
RUN npm install

# Use a separate slim image for production
FROM node:lts-alpine

# https://github.com/uNetworking/uWebSockets.js/discussions/346
RUN apk add --no-cache libc6-compat 
RUN ln -s /lib/libc.musl-x86_64.so.1 /lib/ld-linux-x86-64.so.2

# Set working directory
WORKDIR /app

# Copy necessary files from the builder stage and the rest of the application
COPY --from=builder /app/node_modules ./node_modules

# Remove unnecessary uWebSockets.js binaries
RUN rm node_modules/uWebSockets.js/uws_linux_x64_*.node \
    node_modules/uWebSockets.js/uws_darwin_x64_*.node \
    node_modules/uWebSockets.js/uws_win32_x64_*.node \
    node_modules/uWebSockets.js/uws_linux_arm_*.node \
    node_modules/uWebSockets.js/uws_darwin_arm64_*.node
    
# Copy the rest of the application
COPY . .

# Expose port 80
EXPOSE 80

# Start the service using the start script from package.json
CMD [ "npm", "run", "start" ]
