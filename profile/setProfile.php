<?php
include "koneksi.php";

$sql =  "update profile set nama = '".$_POST["nama"]."',  email = '".$_POST["email"]."', alamat = '".$_GET["alamat"]."', sekolah= '".$_POST["sekolah"]."', agama= '".$_POST["agama"]."', status= '".$_POST["status"]."' WHERE id=1";

if ($conn->query($sql) === TRUE) {
  echo $sql;
} else {
  echo "Error updating record: " . $conn->error;
}


?>