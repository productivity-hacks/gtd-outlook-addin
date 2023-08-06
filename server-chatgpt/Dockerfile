# Use the official Node.js image (Alpine-based)
FROM node:20-alpine3.17

# Set the working directory inside the container
WORKDIR /usr/src/app

# Install OpenAI library directly from npm registry
RUN npm install openai

# Copy the rest of the application code into the container
COPY . .

# Command to run the Node.js application
CMD [ "node", "index.js" ]