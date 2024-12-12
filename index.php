<?php
/** * © 2024 Tu Nombre. Todos los derechos reservados. * 
 * Licenciado bajo la Licencia MIT. Ver archivo LICENSE para más detalles. */
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Billetera Duralit</title>
    <link rel="icon" type="image/png" href="./src/LOGO ESQUINA WEB ICONO.png">
    <!-- Enlace a Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="manifest" href="/manifest.json">
    <style>
        .logo {
            width: 150px;
            height: auto;
            cursor: pointer;
        }
        .modal-custom {
            background: linear-gradient(135deg, #f6f8f9 0%, #e5ebee 100%);
        }
        .contact-info {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
        }
        .contact-info i {
            margin-right: 10px;
            color: #007bff;
        }
        .btn-custom {
            background-color: #007bff;
            color: white;
            transition: all 0.3s ease;
        }
        .btn-custom:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }
        .profile-img {
            width: 80px;  /* Reducido de 100px a 80px */
            height: 80px; /* Reducido de 100px a 80px */
            border-radius: 50%;
            object-fit: cover;
            border: 3px solid #007bff;
        }
        .contact-link {
            color: #007bff;
            text-decoration: none;
            transition: color 0.3s ease;
        }
        .contact-link:hover {
            color: #0056b3;
            text-decoration: underline;
        }
    </style>
</head>

<body class="bg-light">

    <div class="container d-flex flex-column align-items-center vh-100 mt-5">
        
        <!-- Logo centrado con tamaño ajustado -->
        <img id="logoImage" src="./src/LOGO.png" alt="Logo" class="mb-4 logo">

        <!-- Contenedor del formulario de login -->
        <div class="card shadow-sm p-4" style="width: 100%; max-width: 400px;">
            <form action="" method="post">
                <h1 class="text-center mb-4">Ingresar</h1>

                <?php
                if (file_exists("Conexion/conexion.php")) {
                    include "Conexion/conexion.php";
                } else {
                    die("No se encontró el archivo de conexión.");
                }

                if (file_exists("Controlador/login.php")) {
                    include "Controlador/login.php";
                } else {
                    die("No se encontró el archivo del controlador de login.");
                }
                ?>

                <!-- Input de usuario sin label -->
                <div class="mb-3">
                    <input type="text" id="Codigo_empleado" name="Codigo_empleado" class="form-control" placeholder="Usuario" required>
                </div>

                <!-- Input de contraseña sin label -->
                <div class="mb-3">
                    <input type="password" id="Password" name="Password" class="form-control" placeholder="Contraseña" required>
                </div>

                <!-- Botón de ingresar -->
                <div class="d-grid">
                    <input name="btningresar" class="btn btn-primary" type="submit" value="Ingresar">
                </div>
            </form>
        </div>
    </div>

    <!-- Enlace a Bootstrap JS y Popper.js -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        if ('serviceWorker' in navigator) {
            window.addEventListener('load', () => {
                navigator.serviceWorker.register('/service-worker.js')
                    .then(registration => {
                        console.log('ServiceWorker registrado con éxito:', registration);
                    })
                    .catch(error => {
                        console.log('Error en el registro del ServiceWorker:', error);
                    });
            });
        }
    </script>
</body>

</html>