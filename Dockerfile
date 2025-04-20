# Step 1: Use a base image that suits your app
FROM node:14 AS build

# Step 2: Set working directory
WORKDIR /app

# Step 3: Copy package.json and install dependencies
COPY package.json package-lock.json ./
RUN npm install

# Step 4: Copy application code
COPY . .

# Step 5: Build your application (e.g., if it's a React app or Node.js app)
RUN npm run build

# Step 6: Use a lighter image to run the app
FROM node:14-slim

# Step 7: Set working directory
WORKDIR /app

# Step 8: Copy from the build stage
COPY --from=build /app /app

# Step 9: Expose the app port
EXPOSE 8080

# Step 10: Command to run the app
CMD ["npm", "start"]
