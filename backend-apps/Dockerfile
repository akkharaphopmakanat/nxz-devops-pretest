FROM node:22.13.1 AS build

# setup working directory
WORKDIR /app

# copy all dependency files
COPY package*.json ./
COPY tsconfig.json ./

# install dependencies
RUN npm install

# copy all source files into the container
COPY . .

# build the application
RUN npm run build

FROM node:22.13.1 AS run

WORKDIR /app

# copy the built files
COPY --from=build /app/dist ./dist
COPY --from=build /app/node_modules ./node_modules
COPY --from=build /app/package*.json ./

# expose the port the app runs on
EXPOSE 3000

# run the built application
CMD ["node", "dist/index.js"]