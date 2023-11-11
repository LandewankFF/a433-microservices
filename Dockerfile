# Stage 1: Base stage
FROM node:18-alpine as base
# Set working directory di dalam container
WORKDIR /src
# Copy package.json dan package-lock.json ke dalam container
COPY package*.json ./
# Install dependencies
RUN npm install
# Copy isi direktori proyek ke dalam container
COPY . .

# Stage 2: Production stage
FROM base as production
# Set environment untuk production
ENV NODE_ENV=production
# Install dependencies menggunakan package-lock.json
RUN npm ci
# Copy file-file aplikasi ke dalam container
COPY ./*.js ./
CMD ["node", "index.js"]

# Expose port yang akan digunakan oleh aplikasi
EXPOSE 3000
# Command untuk menjalankan aplikasi pada mode production
CMD ["node", "index.js"]

# Stage 3: Development stage
FROM base as dev
# Install bash dan wait-for-it.sh untuk development
RUN apk add --no-cache bash
RUN wget -O /bin/wait-for-it.sh https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh
RUN chmod +x /bin/wait-for-it.sh

ENV NODE_ENV=development
RUN npm install
COPY ./*.js ./
# Command untuk menjalankan aplikasi pada mode production 
CMD ["node", "index.js"]