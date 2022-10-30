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

    //user query
    $result = $user->read();
    // Get row count
    $num = $result->rowCount();

    //check if there is a users
    if($num > 0) {
        // users array
        $users_arr = array();
        $users_arr['data'] = array();

        while($row = $result->fetch(PDO::FETCH_ASSOC)){
            extract($row);

            $user_item = array(
                'name' => $name,
                'email' => $email,
                'country' => $country,
                'city' => $city,
            );

            //push to "data"
            array_push($users_arr['data'], $user_item);
        }
        //JSON & output
        echo json_encode($users_arr);
    } else {
        // no users
        echo json_encode(
            array('message' => 'No users found')
        );
    }

?>