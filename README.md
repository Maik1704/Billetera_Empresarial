## Descripción del Proyecto
Esta aplicación es una billetera móvil diseñada para facilitar la gestión de abonos y transferencias entre trabajadores de una empresa. Permite a los empleados recibir abonos que pueden ser utilizados en empresas asociadas, así como realizar transferencias a otros compañeros de trabajo. La aplicación busca optimizar el uso de beneficios y mejorar la experiencia de los empleados al gestionar sus recursos de manera eficiente.

## Funcionalidades
Abonos a Trabajadores: La empresa puede realizar abonos a los trabajadores, que se reflejan en sus billeteras móviles.
Transferencias entre Trabajadores: Los empleados pueden transferir fondos a otros trabajadores de la misma empresa, facilitando el intercambio de recursos.
Integración con Empresas Asociadas: Los usuarios pueden utilizar sus abonos en empresas asociadas, promoviendo el uso de beneficios en el comercio local.
Estructura de la Base de Datos
La base de datos está definida en el archivo Schema.sql, que incluye las tablas necesarias para gestionar usuarios, abonos y transferencias. Asegúrate de ejecutar este script en tu sistema de gestión de bases de datos para crear la estructura necesaria.

## Contenerización
La aplicación está preparada para ser ejecutada en un contenedor Docker. Para ello, se han proporcionado los siguientes archivos:

## Dockerfile: Este archivo contiene las instrucciones necesarias para construir la imagen de la aplicación.
docker-compose.yml: Este archivo permite orquestar la ejecución de la aplicación y sus dependencias en contenedores.
