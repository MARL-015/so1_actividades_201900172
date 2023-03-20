# Actividad 4
#### ***201900172***

Crear un systemd unit de tipo servicio para ejecutar un script que imprima un saludo y la fecha actual.
### Proceso de instalación tipo servicio systemd unit

Systemd es un conjunto de daemons de administración del sistema Linux estandarización de la mayoría de distribuciones de Debian y Red Hat, bibliotecas y herramientas diseñados como una plataforma de administración y configuración central para interactuar con el núcleo del Sistema operativo GNU/Linux.

## Pasos para la instalación

1.	Crea un script que imprima el saludo y la fecha actual. Se puede utilizar el siguiente código y guardarlo en un archivo *saludo.sh*:
    ```
    #!/bin/bash 
    echo "¡Hola, Bienvenid@! Hoy es $(date)"
    ```
    Este script mostrará el saludo solicitado, teniendo en cuenta que el script tenga permisos de ejecución.
    ```
    chmod +x saludo.sh 
    ```

2. Se crea un archivo de systemd unit en la carpeta */etc/systemd/system/*, nombrandolo por ejemplo: **saludar.service** 
    ```
    sudo nano /etc/systemd/system/saludar.service 
    ```  
3. Dentro de este archivo se debe modificar y agregar el siguiente contenido:
    ```
    [Unit] 
    Description=Imprimir Saludo  
    
    [Service]
    Type=simple 
    ExecStart=/home/linux/Escritorio/Actividades/saludo.sh 
    
    [Install] 
    WantedBy=multi-user.target  
    ``` 
    donde:
    - Unit: se agrega la descripción para el servicio
    - Service: se especifica la ruta del archivo que se desea ejecutar, usando el parametro ExecStart.
    - Install: se debe especificar en que modo se iniciará el servicio.

4. Ya modificado el servicio se guarda y cierra el archivo.

5. Se deben recargar los servicios (la configuración systemd) para que incluya el nuevo archivo creado, se puede hacer uso del siguiente comando:
    ```
    sudo systemctl daemon-reload   
    ``` 
6. Si se desea que el servicio cargue desde el arranque del sistema se habilita con el siguiente comando:
    ```
    sudo systemctl enable saludar.service   
    ```
7. Se inicia el servicio con el siguiente comando:
    ```
    sudo systemctl start saludar.service   
    ```
    Esto iniciará el servicio y ejecutará el script saludo.sh.

8. Verficar que el servicio se este ejecutando correctamente y mostrando el saludo que enviamos, de la siguiente manera:
    ```
    sudo systemctl status saludar.service    
    ```
Con estos pasos ya se puede crear cualquier servicio systemd unit que se desee.