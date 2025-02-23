<?php 
// conexión con la base de datos
require('conexion.php');

// Recogemos los datos del formulario
$idSurtidor = $_POST['idSurtidor'];

// nos declaramos una variable
// y ahí escribimos la consulta
//Vamos a restar de la cantidad de litros del tanque lo que se reposte
$comprobarExiste="SELECT * FROM $surtidor WHERE id = $idSurtidor";
$consultaExiste = mysqli_query($conexion, $comprobarExiste);

// Comprobamos que exista un surtidor con ese id
if (mysqli_num_rows($consultaExiste) < 1) {
    echo "No existe un surtidor con ese id";
} else {
    $consulta = "DELETE FROM $surtidor WHERE id = $idSurtidor";

    // Damos de baja el surtidor
    if (mysqli_query($conexion, $consulta)) {
        echo "Surtidor dado de baja";
    } else {
        echo "Error: " . $consulta . "<br>" . mysqli_error($conexion);
    }
}

// cerramos la conexión
mysqli_close($conexion); 
?>