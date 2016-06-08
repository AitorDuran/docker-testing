# docker-testing

Testeo del servidor LAMP

Para usar este repositorio con docker engine, tan solo debemos tener instalado docker-compose y ejecutar el comando
docker-compose up -d (para que se ejecute en segundo plano), para modificar cambios se usaria docker-compose up -d --build.

Recomiendo para uso en local la instalación de docker-machine, esta API de docker instala nuestro entorno en una maquina
virtual con boot2docker. 

Para ejecutar el testeo en local bastaria con arrancar nuestros contenedores, pasarle un docker ps -a para copiar el ID del contenedor
y ejecutar el comando docker logs <ID_CONTAINER>.

Si queremos saber el codigo de retorno de nuestro test utilizaremos un docker wait <ID_CONTAINER>, nos devuelve 0 o 1, esto
puede ser util para realizar scripting.
