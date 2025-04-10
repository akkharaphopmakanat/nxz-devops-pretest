FROM node:22.13.1

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

# expose the port the app runs on
EXPOSE 3000

# run the application
CMD ["npm", "start"]
