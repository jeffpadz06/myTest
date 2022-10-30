<?php 
    header('Access-Controll-Allow-Origin: *');
    header('Content-Type: application/json');
    header('Access-Control-Allow-Methods: POST');
    header('Access-Control-Allow-Headers: Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authorization, X-Requested-With');

    include_once '../../config/Database.php';
    include_once '../../models/users.php ';

    // db & connect;
    $database = new Database();
    $db = $database->connect();

    // user object
    $user = new User($db);

    //get posted data
    $data = json_decode(file_get_contents("php://input"));

    $user->name = $data->name;
    $user->email = $data->email;
    $user->ip_address = $data->ip_address;

    //insert
    if($user->create()) {
        echo json_encode(
            array('message' => 'Successful')
        );
    } else {
        echo json_encode(
            array('message' => 'Sorry may be next time')
        );
    }
?>
