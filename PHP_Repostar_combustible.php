<?php 
// conexión con la base de datos
require('conexion.php');

// Recogemos los datos del formulario
$tipo_combustible = $_POST['tipo'];
$surtidor = $_POST['surtidor'];
$litros = $_POST['litros'];
$fecha = $_POST['fecha'];

// Determinamos el tanque basado en el tipo de combustible
switch ($tipo_combustible) {
    case 'Gasolina 95':
        $tanque = 1;
        break;
    case 'Gasolina 98':
        $tanque = 2;
        break;
    case 'Diesel':
        $tanque = 3;
        break;
    case 'Diesel premium':
        $tanque = 4;
        break;
    default:
        $tanque = 0;
}

// nos declaramos una variable
// y ahí escribimos la consulta
//Vamos a restar de la cantidad de litros del tanque lo que se reposte
$consulta_restar_litros = "UPDATE $tanque_db SET cantidad = cantidad - $litros WHERE producto = '$tipo_combustible'";
mysqli_query($conexion, $consulta_restar_litros);

//Primero vamos a ver el precio del combustible seleccionado
$consulta_precio = "SELECT precio FROM $tanque_db WHERE producto = '$tipo_combustible'";
$resultado_precio = mysqli_query($conexion, $consulta_precio);

// Asegúrate de que la consulta devuelve un valor y extráelo
$row_precio = mysqli_fetch_assoc($resultado_precio);
$precio = $row_precio['precio'];  // El nombre de la columna 'precio' debe coincidir con el de la base de datos

$importe = $litros * $precio;

$consulta = "INSERT INTO $tabla (surtidor_id, tanque_id, fecha, cantidad, tipo, importe) VALUES ('$surtidor', '$tanque', '$fecha', '$litros', '$tipo_combustible', $importe)";

// ejecutamos la consulta SQL
if (mysqli_query($conexion, $consulta)) {
    echo "Datos insertados correctamente";
} else {
    echo "Error: " . $consulta . "<br>" . mysqli_error($conexion);
}

// cerramos la conexión
mysqli_close($conexion); 
?>