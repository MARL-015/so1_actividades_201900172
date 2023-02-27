# Actividad 3
### Solución al error 404 que presenta el frontend con react y el manejo de rutas en nginx
El problema que se presenta un error 404 al momento de cargar una URL específica en la aplicación frontend es debido a que al hacer uso de React es que este esta renderizado unicamente al URL que se esta mostrando, es decir unicamente para la ruta "**home**", es por eso que al redirigir a otras rutas que no sean el index nos dara ese error dando a entender que estamos visitando una ruta/página practicamente que no existe e impedira que está se cargue correctamente.

Para solucionar el problema, es necesario modificar la configuración del server nginx que estamos utilizando, en este caso se debe crear un archivo de configuracion llamado **nginx.conf** con el siguiente contenido:

```
# nginx.conf
user  nginx; #usuario que ejecutara los procesos
events{}
http{
    include /etc/nginx/mime.types;
    access_log  /var/log/nginx/access.log  main;
    server{
        listen 80;
        server_name _;
        root /usr/share/nginx/html;
        index index.html;
        location / {
            try_files $uri $uri/ /index.html;
        }
    }
}
```

Este archivo servirá para definir la configuración principal de nginx que permita los archivos de registro y configuraciones del servidor web. 

Para aplicar los cambios también es necesario modificar el archivo Dockerfile de la imagen de nginx, agregando la siguiente linea de código:

```
COPY nginx.conf /etc/nginx/conf.d/default.conf
```
La función de esta linea de codigo es copiar dentro del contenedor la nueva configuración que se indico en el archivo nginx.conf.
También las siguientes lineas para configurar correctamente el server nginx exponer el puerto para que este quede público e iniciar el servidor web para asi de esa manera evitar que se ejecute en segundo plano y se ejecute correctamente nuestro contenedor durante todo el tiempo que se tenga activo el servidor.
```
# Exponer el puerto 80 y ejecutar nginx
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
```

Quedando nuestro archivo ```nginx.Dockerfile``` corregido, de la siguiente manera:
```
## BUILD
# docker build -t mifrontend:0.1.0-nginx-alpine -f nginx.Dockerfile .
## RUN
# docker run -d -p 3000:80 mifrontend:0.1.0-nginx-alpine
FROM node:18.14.0-buster-slim as compilacion

LABEL developer="jesus guzman" \
      email="susguzman@gmail.com"

ENV REACT_APP_BACKEND_BASE_URL=http://localhost:3800

# Copy app
COPY . /opt/app

WORKDIR /opt/app

# Npm install
RUN npm install

RUN npm run build

# Fase 2
FROM nginx:1.22.1-alpine as runner

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=compilacion /opt/app/build /usr/share/nginx/html

# Exponer el puerto 80 y ejecutar nginx
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
```