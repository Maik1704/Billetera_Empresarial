<?php
session_start();
/** * © 2024 Tu Nombre. Todos los derechos reservados. * 
 * Licenciado bajo la Licencia MIT. Ver archivo LICENSE para más detalles. */

$_SESSION = [];

// Eliminar la cookie de sesión si está configurada
if (ini_get("session.use_cookies")) {
    $params = session_get_cookie_params();
    setcookie(session_name(), '', time() - 42000,
        $params["path"], $params["domain"],
        $params["secure"], $params["httponly"]
    );
}

// Destruir la sesión
session_destroy();

// Redirigir al usuario a la página de inicio o login
header("Location: ../index.php"); // Asegúrate de que esta ruta sea correcta
exit();
