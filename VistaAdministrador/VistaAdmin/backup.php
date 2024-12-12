<?php
/** * © 2024 Tu Nombre. Todos los derechos reservados. * 
 * Licenciado bajo la Licencia MIT. Ver archivo LICENSE para más detalles. */

 // Configuración de la base de datos
$host = 'localhost';
$username = 'duralitc_billetera';
$password = '$gp2079700'; 
$database = 'duralitc_billetera';
$port = 3306;

// Nombre del archivo de backup
$backupFile = 'backup_' . date('Y-m-d_H-i-s') . '.sql';

// Comando para generar el backup
$command = "mysqldump --user=$username --password='$password' --host=$host --port=$port $database > $backupFile";

// Ejecutar el comando
system($command, $output);

// Verificar si se creó el archivo
if (file_exists($backupFile)) {
    // Descargar el archivo
    header('Content-Description: File Transfer');
    header('Content-Type: application/octet-stream');
    header('Content-Disposition: attachment; filename="' . basename($backupFile) . '"');
    header('Expires: 0');
    header('Cache-Control: must-revalidate');
    header('Pragma: public');
    header('Content-Length: ' . filesize($backupFile));
    readfile($backupFile);
    unlink($backupFile); // Eliminar el archivo después de la descarga
    exit;
} else {
    echo "Error al realizar el backup.";
}
?>