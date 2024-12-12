<?php
session_start();

// Verificar si el usuario est�� logueado
if (!isset($_SESSION['Nombre_Completo'])) {
    header("Location: ../../index.php");
    exit();
}

function registrarPuesto($conexion) {
    if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['btnregistrar'])) {
        $nombre = $_POST['Nombre'];

        // Insertar los datos en la base de datos
        $sql = "INSERT INTO puesto (Nombre) VALUES (?)";
        $stmt = $conexion->prepare($sql);
        $stmt->bind_param("s", $nombre);

        if ($stmt->execute()) {
            // Establecer mensaje de ��xito en la sesi��n
            $_SESSION['success'] = "Puesto registrado exitosamente.";
            header("Location: Puesto.php"); // Redirigir de vuelta a la lista de puestos
            exit();
        } else {
            // Establecer mensaje de error en la sesi��n
            $_SESSION['error'] = "Error al registrar el puesto.";
            header("Location: Puesto.php"); // Redirigir de vuelta a la lista de puestos
            exit();
        }
    }
}

// Manejar el registro del puesto
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['btnregistrar'])) {
    registrarPuesto($conexion); // Llama a la funci��n de registrar puesto
}
?>