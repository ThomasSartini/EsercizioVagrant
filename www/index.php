
<h1>PHP test connection </h1>
<p>elementi nella tabella valori, del db vagrant, dell'host 10.10.20.15: </p>

<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
    $conn = new mysqli("10.10.20.15","vagrant","vagrantpass", "vagrant");
    $result = $conn->query("SELECT * FROM valori");
    if ($result->num_rows > 0) {
        while($row = $result->fetch_assoc()) {
            echo  $row["id"]." " .$row["valore"];
        }
    } else {
        echo "0 results";
    }
?>