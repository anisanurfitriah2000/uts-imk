<?php
include "koneksi.php";

$sql = "SELECT * FROM profile  WHERE id=1";

$result = $conn->query($sql);

if ($result->num_rows > 0) {
  
  while($row = $result->fetch_assoc()) {
    //echo "id: " . $row["nama"]. " - Name: " . $row["nama"]. " " . $row["nama"]. "<br>";
	echo json_encode($row);
  }
} else {
  echo "0 results";
}

?> 