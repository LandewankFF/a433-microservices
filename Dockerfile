FROM node:14
#membuat folder baru dengan nama app
WORKDIR /app
#mengcopy semua file yang ada dalam folder
COPY . .

#environment pengembangan production menggunakan database host item-db
ENV NODE_ENV=production
ENV DB_HOST=item-db

#build aplikasi
RUN npm install --production --unsafe-perm && npm run build

#Berjalan di port 8080
EXPOSE 8080
#menjalankan perintah npm start untuk menjalankan aplikasi
CMD ["npm", "start"]