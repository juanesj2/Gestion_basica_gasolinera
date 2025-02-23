<?php 
// conexión con la base de datos
require('conexion.php');

// Recogemos los datos del formulario
$nombre = $_POST['nombre'];

// nos declaramos una variable
// y ahí escribimos la consulta
//Vamos a restar de la cantidad de litros del tanque lo que se reposte
$comprobarExiste="SELECT * FROM $surtidor WHERE nombre = '$nombre'";
$consultaExiste = mysqli_query($conexion, $comprobarExiste);

// Comprobamos que no exista un surtidor con el mismo nombre
if (mysqli_num_rows($consultaExiste) > 0) {
    echo "Ya hay un surtidor con ese nombre, prueba otro";
} else {
    $consulta = "INSERT INTO $surtidor (nombre) VALUES ('$nombre')";

    // Damos de alta el surtidor
    if (mysqli_query($conexion, $consulta)) {
        echo "Surtidor dado de alta";
    } else {
        echo "Error: " . $consulta . "<br>" . mysqli_error($conexion);
    }
}

// cerramos la conexión
mysqli_close($conexion); 
?>