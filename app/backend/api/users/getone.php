<?php
    header('Access-Controll-Allow-Origin: *');
    header('Content-Type: application/json');

    include_once '../../config/Database.php';
    include_once '../../models/users.php ';

    // db & connect;
    $database = new Database();
    $db = $database->connect();

    // user object
    $user = new User($db);

    //get one user using id
    $user->id = isset($_GET['id']) ? $_GET['id'] : die();
    //get user
    $user->read_single();

    //create array
    $user_arr = array (
        'id' => $user->id,
        'name' => $user->name,
        'email' => $user->email,
        'country' => $user->country,
        'city' => $user->city
    );

    //JSON
    print_r(json_encode($user_arr));
?>