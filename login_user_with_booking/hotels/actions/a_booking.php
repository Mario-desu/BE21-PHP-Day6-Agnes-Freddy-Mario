<?php
session_start();

// if (isset($_SESSION[ 'user']) != "") {
//    header("Location: ../../home.php");
//    exit;
// }

if  (!isset($_SESSION['adm']) && !isset($_SESSION['user'])) {
   header("Location: ../../index.php" );
    exit;
}


require_once '../../components/db_connect.php' ;
// require_once '../../components/file_upload.php';



if ($_POST['hotel_id']) {
    $id = $_POST['hotel_id'];
    $uid = $_SESSION['adm'];
    // echo $uid;
    // var_dump($_SESSION);
    $sql = "INSERT INTO booking (fk_hotelID, fk_userID) VALUES ($id, $uid)";
    $book_create = mysqli_query($connect, $sql);
    echo $book_create;
    $booking = mysqli_query($connect ,"SELECT hotels.hotelImage, hotels.hotelName, hotels.hotelLoc, hotels.hotelPrice FROM booking JOIN hotels ON fk_hotelID = hotels.hotel_id WHERE fk_userID={$uid}");
    $bbody=''; // this variable will hold the body for the table
    
    if(mysqli_num_rows($booking)  > 0) {     
        while($row = mysqli_fetch_array($booking, MYSQLI_ASSOC)){         
            $bbody .= "<tr>
                <td><img class='img-thumbnail' src='../../pictures/".$row['hotelImage']."'</td>
                <td>" .$row['hotelName']."</td>
                <td>" .$row['hotelLoc']."</td>                
                <td>" .$row['hotelPrice']."</td>
            </tr>";
        };
    } else  {
        $bbody = "<tr><td colspan='5'><center>No Bookings</center></td></tr>";
    }
    
}
    $connect->close();
?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <?php require_once '../../components/boot.php'?>
    <title>Booking</title>
</head>
<body>
    <div class="container">
    <a href='../booking_dash.php'><button class='btn btn-success btn-sm' type='button'>Back to DashBoard</button></a> 
    <table class='table table-striped'>
        <thead class='table-success'>
            <tr>
                <th>Image</th>
                <th>Hotel Name</th>
                <th>Location</th>             
                <th>Price</th>
            </tr>
        </thead>
        <tbody>
            <?php echo $bbody;?>
        </tbody>
    </table>
    </div>
</body>
</html>