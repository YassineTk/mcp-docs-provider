# Generated by https://smithery.ai. See: https://smithery.ai/docs/config#dockerfile
FROM node:lts-alpine

# Set working directory
WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies (ignore scripts to avoid running postinstall if any)
RUN npm install --ignore-scripts

# Copy rest of the code
COPY . .

# Build the project
RUN npm run build

# Ensure the built file is executable
RUN chmod +x build/index.js

# Expose port if needed (optional, MCP usually uses stdio, so not exposing any ports)

# Command to run the MCP server using the provided configuration (docPath must be provided as argument)
CMD ["node", "build/index.js", "/data/documentation.md"]
