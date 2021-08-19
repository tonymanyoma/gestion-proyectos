
## Descripción de la app

1. Se requiere una aplicación la cual cuente con un sistema de autenticaión .

2. La aplicación le permitirá al usuario que se registre seleccionar una compañia a la cual pertenece.

3. El usuario tendrá acceso a un dashboard desde el cual podrá ver información resumida como el total de proyectos.

4. Se pueden crear,ver,editar y eliminar proyectos.

5. Se pueden crear,ver,editar y eliminar historias de sus respectivos proyectos.

6. Se pueden generar tickets por cada historia, estos tickets se crean con un estado activo y este puede ser actualizado por : en proceso y finalizado



# Tecnologías uttilizadas
1. Laravel
2. Vuejs
3. Mysql
4. Bootstrap
5. Vuesax

# Manual de usuario

# Requerimientos
1. Node js
2. Mysql
3. Composer

# Ejecución
1. Clonar repositorio
2. Crear base de datos con el nombre fusepong, importar archivo "fusepong.sql" 
3. Descomprimir .env.zip en la raiz del proyecto
4. Ejecutar composer install
5. Ejecutar npm install
6. Ejecutar los siguientes comandos:
    - php artisan key:generate
    - php artisan jwt:secret
    - php artisan config:cache
    - php artisan cache:clear
    - php artisan view:clear 
 
7. Ejecutar el proyecto con el comando php artisan serve 

8. para crear una cuenta se debe hacer click en la opción "¿No tienes una cuenta? Regístrate",
ubicada en la parte inferior del botón de iniciar sesión.

9. La base de datos ya cuenta con unos usuarios de prueba los cuales son: 
- antony@email.com contraseña: 123456
- juan@email.com contraseña: 123456

