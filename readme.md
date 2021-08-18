
## Descripción del problema

1. Se requiere una aplicación la cual cuente con un sistema de autenticaión y un manejo de roles, los cuales serán
administrador y alumno.

2. La aplicación le permitirá al administrador gestionar usuarios, cursos y matrículas.

3. El administrador tendrá acceso a un dashboard desde el cual podrá ver información resumida como el total de usuarios,cursos y matriculas registradas.

4. Solo se podrá crear una matricula por alumno desde la cual se le podrán añadir uno o muchos cursos.

5. El alumno tendrá acceso a un dashboard desde el cual podrá ver el total de cursos matriculados.

6. El alumno solo podrá ver los cursos que tiene matriculados.


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
2. Crear base de datos con el nombre spira, importar archivo "spira.sql" y configurar archivo .env
3. Ejecutar composer install
4. Ejecutar npm install
5. Ejecutar los siguientes comandos:
    - php artisan key:generate
    - php artisan jwt:secret
    - php artisan config:cache
    - php artisan cache:clear
    - php artisan view:clear  

6. para crear una cuenta se debe hacer click en la opción "¿No tienes una cuenta? Regístrate",
ubicada en la parte inferior del botón de iniciar sesión, aquí se creará un usuario con rol administrador.

