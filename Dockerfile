# Usamos una imagen ligera de Node.js (ajusta la versión si es necesario)
FROM node:18-alpine

# Directorio de trabajo dentro del contenedor
WORKDIR /app

# Copiamos primero los archivos de dependencias para aprovechar la caché de Docker
COPY package*.json ./

# Instalamos dependencias
RUN npm install

# Copiamos el resto del código fuente
COPY . .

# Exponemos el puerto (ajusta si tu app usa otro, ej: 8080, 5173 para Vite, etc.)
EXPOSE 3000

# Comando para iniciar la app.
# Si es un proyecto de desarrollo usa "npm start"
# Si es producción y tienes un build, sería "npm run build" y luego servirlo.
CMD ["npm", "start"]