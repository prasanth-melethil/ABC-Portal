# Use official Node.js 22-slim image for the runtime
FROM node:22-slim

# Set the working directory
WORKDIR /app

# Copy the build artifacts and necessary files
COPY .next .next
COPY public public
COPY package.json pnpm-lock.yaml ./

# Install pnpm globally
RUN npm install -g pnpm

# Install only production dependencies
RUN pnpm install --prod

# Expose the port the app will run on
EXPOSE 3000

# Start the Next.js application
CMD ["pnpm", "start"]