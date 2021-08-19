-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-08-2021 a las 19:15:53
-- Versión del servidor: 10.4.13-MariaDB
-- Versión de PHP: 7.2.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `fusepong`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `companias`
--

CREATE TABLE `companias` (
  `id` int(10) UNSIGNED NOT NULL,
  `nit` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nombre` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefono` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direccion` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `companias`
--

INSERT INTO `companias` (`id`, `nit`, `nombre`, `telefono`, `direccion`, `created_at`, `updated_at`) VALUES
(1, '9023456', 'super net', '123456', 'calle 45', NULL, NULL),
(2, '903487', 'ascomp', '987654', 'calle 56', NULL, NULL),
(3, '90023014', 'promax', '6636789', 'calle 89', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

CREATE TABLE `estados` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `estados`
--

INSERT INTO `estados` (`id`, `nombre`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, 'Activo', 'activo', NULL, NULL),
(2, 'Inactivo', 'inactivo', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_tickets`
--

CREATE TABLE `estado_tickets` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `estado_tickets`
--

INSERT INTO `estado_tickets` (`id`, `nombre`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, 'Activo', 'activo', NULL, NULL),
(2, 'En proceso', 'en proceso', NULL, NULL),
(3, 'Finalizado', 'finalizado', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historias`
--

CREATE TABLE `historias` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_proyecto` int(10) UNSIGNED DEFAULT NULL,
  `id_estado` int(10) UNSIGNED DEFAULT NULL,
  `comentarios` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `historias`
--

INSERT INTO `historias` (`id`, `nombre`, `id_proyecto`, `id_estado`, `comentarios`, `created_at`, `updated_at`) VALUES
(1, 'inventario', 1, 1, 'poder gestionar el inventario', '2021-08-19 01:39:39', '2021-08-19 01:39:39'),
(2, 'Ventas', 1, 1, 'poder realizar las respectivas ventas', '2021-08-19 15:25:20', '2021-08-19 15:33:39'),
(3, 'Clientes', 1, 1, 'poder realizar la gestión de clientes', '2021-08-19 15:26:40', '2021-08-19 15:31:51'),
(4, 'diseñar home', 3, 1, 'diseñar home', '2021-08-19 15:56:27', '2021-08-19 15:56:27'),
(5, 'mostrar productos', 3, 1, 'mostrar productos', '2021-08-19 15:57:47', '2021-08-19 15:57:47'),
(6, 'implementar pasarella de pagos', 3, 1, 'implementar pasarella de pagos', '2021-08-19 15:58:35', '2021-08-19 15:58:35'),
(7, 'diseñar interfaz general', 2, 1, 'diseñar interfaz general', '2021-08-19 15:59:46', '2021-08-19 15:59:46'),
(8, 'agregar calendario', 2, 1, 'agregar calendario para toma de citas', '2021-08-19 16:00:15', '2021-08-19 16:00:15'),
(9, 'implementar notificaciones', 2, 1, 'implementar notificaciones de recordatorio', '2021-08-19 16:00:37', '2021-08-19 16:00:37');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2021_08_17_092940_create_tipo_documentos_table', 1),
(4, '2021_08_17_092941_create_roles_table', 1),
(5, '2021_08_17_092942_create_companias_table', 1),
(6, '2021_08_17_092942_create_estados_table', 1),
(7, '2021_08_17_092943_create_estado_tickets_table', 1),
(8, '2021_08_17_092943_create_usuarios_table', 1),
(15, '2021_08_18_081821_create_proyectos_table', 5),
(20, '2021_08_18_081909_create_historias_table', 10),
(21, '2021_08_18_081920_create_tickets_table', 11);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyectos`
--

CREATE TABLE `proyectos` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_compania` int(10) UNSIGNED DEFAULT NULL,
  `id_estado` int(10) UNSIGNED DEFAULT NULL,
  `nombre` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `proyectos`
--

INSERT INTO `proyectos` (`id`, `id_compania`, `id_estado`, `nombre`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'crm administrativo', 'crm para control interno de la empresa sucroal s.a.s', '2021-08-18 22:55:12', '2021-08-18 23:12:27'),
(2, 1, 1, 'app mobile citas', 'aplicación mobile para gestionar citas', '2021-08-19 15:42:49', '2021-08-19 15:42:49'),
(3, 2, 1, 'app mobile e-commerce', 'aplicacion mobile de e-commerce', '2021-08-19 15:55:35', '2021-08-19 15:55:35');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `nombre`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, 'Administrador', 'administrador', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tickets`
--

CREATE TABLE `tickets` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_historia` int(10) UNSIGNED DEFAULT NULL,
  `id_estado` int(10) UNSIGNED DEFAULT NULL,
  `id_estado_ticket` int(10) UNSIGNED DEFAULT NULL,
  `comentarios` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tickets`
--

INSERT INTO `tickets` (`id`, `nombre`, `id_historia`, `id_estado`, `id_estado_ticket`, `comentarios`, `created_at`, `updated_at`) VALUES
(1, 'crear interfaz del modulo de productos', 1, 1, 2, 'crear interfaz del modulo de productos', NULL, NULL),
(5, 'listar productos', 1, 1, 2, 'listar productos de forma ascendente', '2021-08-19 15:18:49', '2021-08-19 16:20:33'),
(6, 'crear productos', 1, 1, 3, 'crear productos', '2021-08-19 15:43:42', '2021-08-19 15:44:17'),
(7, 'importar productos', 1, 1, 3, 'importar productos desde excel', '2021-08-19 15:44:05', '2021-08-19 15:44:12'),
(8, 'listar clientes', 3, 1, 3, 'ver listado de clientes', '2021-08-19 17:01:08', '2021-08-19 17:02:14'),
(9, 'crear clientes', 3, 1, 3, 'crear clientes', '2021-08-19 17:01:21', '2021-08-19 17:02:10'),
(10, 'editar clientes', 3, 1, 2, 'editar clientes', '2021-08-19 17:01:34', '2021-08-19 17:02:21'),
(11, 'eliminar clientes', 3, 1, 2, 'eliminar clientes', '2021-08-19 17:01:46', '2021-08-19 17:02:18'),
(12, 'listar ventas', 2, 1, 2, 'listar las ventas creadas', '2021-08-19 17:02:50', '2021-08-19 17:04:38'),
(13, 'generar factura', 2, 1, 3, 'generar la factura correspondiente a cada venta', '2021-08-19 17:03:14', '2021-08-19 17:04:26'),
(14, 'crear venta', 2, 1, 3, 'crear venta y descontar producto del stock', '2021-08-19 17:03:55', '2021-08-19 17:04:20'),
(15, 'anular factura', 2, 1, 2, 'anular factura', '2021-08-19 17:04:13', '2021-08-19 17:04:32'),
(16, 'vincular pasarella', 6, 1, 3, 'vincular pasarella', '2021-08-19 17:07:09', '2021-08-19 17:08:20'),
(17, 'implementar el metodo de pago por tarjeta', 6, 1, 3, 'implementar el metodo de pago por tarjeta', '2021-08-19 17:07:36', '2021-08-19 17:08:26'),
(18, 'implementar el metodo de pago por pse', 6, 1, 2, 'implementar el metodo de pago por pse', '2021-08-19 17:07:52', '2021-08-19 17:08:29'),
(19, 'realizar pruebas', 6, 1, 2, 'realizar pruebas', '2021-08-19 17:08:14', '2021-08-19 17:08:34'),
(20, 'listar productos', 5, 1, 3, 'listar productos', '2021-08-19 17:09:11', '2021-08-19 17:15:30'),
(21, 'mostrar stock restante', 5, 1, 2, 'mostrar stock restante', '2021-08-19 17:12:18', '2021-08-19 17:15:43'),
(22, 'ajustar diseño de la foto del producto', 5, 1, 3, 'ajustar diseño de la foto del producto', '2021-08-19 17:12:49', '2021-08-19 17:15:36'),
(23, 'ajustar card del producto', 5, 1, 2, 'ajustar card del producto', '2021-08-19 17:15:23', '2021-08-19 17:15:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_documentos`
--

CREATE TABLE `tipo_documentos` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tipo_documentos`
--

INSERT INTO `tipo_documentos` (`id`, `nombre`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, 'CC', 'cedula', NULL, NULL),
(2, 'NIT', 'nit', NULL, NULL),
(3, 'PA', 'pasaporte', NULL, NULL),
(4, 'CE', 'cedula extranjera', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_tipo_documento` int(10) UNSIGNED DEFAULT NULL,
  `id_compania` int(10) UNSIGNED DEFAULT NULL,
  `numero_documento` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre_completo` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direccion` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `foto` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_role` int(10) UNSIGNED DEFAULT NULL,
  `id_estado` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `id_tipo_documento`, `id_compania`, `numero_documento`, `nombre_completo`, `telefono`, `direccion`, `email`, `password`, `foto`, `id_role`, `id_estado`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '1113675262', 'antony manyoma', '3207763491', 'calle 4', 'antony@email.com', '$2y$10$EQ9L3wgK2loHgICpb4oss.6F3D.4CWGjnwBm7/pzHJanuRTEI13oK', 'admin.svg', 1, 1, '2021-08-18 15:19:08', '2021-08-18 15:19:08'),
(2, 1, 2, '111254678', 'juan perez', '56565678', 'calle 12', 'juan@email.com', '$2y$10$zRKSO/jZUYJXd/tF58Rf8uXAMRdMQ48xyvrT5.p8XLu/c1Z4iVLuO', 'admin.svg', 1, 1, '2021-08-19 15:52:07', '2021-08-19 15:52:07');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `companias`
--
ALTER TABLE `companias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estados`
--
ALTER TABLE `estados`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estado_tickets`
--
ALTER TABLE `estado_tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `historias`
--
ALTER TABLE `historias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `historias_id_proyecto_foreign` (`id_proyecto`),
  ADD KEY `historias_id_estado_foreign` (`id_estado`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `proyectos`
--
ALTER TABLE `proyectos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `proyectos_id_compania_foreign` (`id_compania`),
  ADD KEY `proyectos_id_estado_foreign` (`id_estado`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tickets_id_historia_foreign` (`id_historia`),
  ADD KEY `tickets_id_estado_foreign` (`id_estado`),
  ADD KEY `tickets_id_estado_ticket_foreign` (`id_estado_ticket`);

--
-- Indices de la tabla `tipo_documentos`
--
ALTER TABLE `tipo_documentos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuarios_id_tipo_documento_foreign` (`id_tipo_documento`),
  ADD KEY `usuarios_id_compania_foreign` (`id_compania`),
  ADD KEY `usuarios_id_role_foreign` (`id_role`),
  ADD KEY `usuarios_id_estado_foreign` (`id_estado`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `companias`
--
ALTER TABLE `companias`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `estados`
--
ALTER TABLE `estados`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `estado_tickets`
--
ALTER TABLE `estado_tickets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `historias`
--
ALTER TABLE `historias`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `proyectos`
--
ALTER TABLE `proyectos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `tipo_documentos`
--
ALTER TABLE `tipo_documentos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `historias`
--
ALTER TABLE `historias`
  ADD CONSTRAINT `historias_id_estado_foreign` FOREIGN KEY (`id_estado`) REFERENCES `estados` (`id`),
  ADD CONSTRAINT `historias_id_proyecto_foreign` FOREIGN KEY (`id_proyecto`) REFERENCES `proyectos` (`id`);

--
-- Filtros para la tabla `proyectos`
--
ALTER TABLE `proyectos`
  ADD CONSTRAINT `proyectos_id_compania_foreign` FOREIGN KEY (`id_compania`) REFERENCES `companias` (`id`),
  ADD CONSTRAINT `proyectos_id_estado_foreign` FOREIGN KEY (`id_estado`) REFERENCES `estados` (`id`);

--
-- Filtros para la tabla `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_id_estado_foreign` FOREIGN KEY (`id_estado`) REFERENCES `estados` (`id`),
  ADD CONSTRAINT `tickets_id_estado_ticket_foreign` FOREIGN KEY (`id_estado_ticket`) REFERENCES `estado_tickets` (`id`),
  ADD CONSTRAINT `tickets_id_historia_foreign` FOREIGN KEY (`id_historia`) REFERENCES `historias` (`id`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_id_compania_foreign` FOREIGN KEY (`id_compania`) REFERENCES `companias` (`id`),
  ADD CONSTRAINT `usuarios_id_estado_foreign` FOREIGN KEY (`id_estado`) REFERENCES `estados` (`id`),
  ADD CONSTRAINT `usuarios_id_role_foreign` FOREIGN KEY (`id_role`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `usuarios_id_tipo_documento_foreign` FOREIGN KEY (`id_tipo_documento`) REFERENCES `tipo_documentos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
