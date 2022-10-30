<?php
    class User {
        //DB str_stuff
        private $conn;
        private $table = 'users';

        //users properties
        public $id;
        public $names;
        public $email;
        public $ip_address;
        public $country;
        public $city;

        //construc w/ db
        public function __construct($db) {
            $this->conn = $db;
        }
  
        //getall users
        public function read() {
            //select query all user
            $query = 'SELECT name, email, country, city FROM ' . $this->table;
            
            //prepare statement
            $stmt = $this->conn->prepare($query);
    
            //execute query
            $stmt->execute();
    
            return $stmt;
        }

        //get one user
        public function read_single() {
            //select query one user
            $query = 'SELECT name, email, country, city FROM ' . $this->table . ' WHERE id = ? LIMIT 0,1';

            //prepare statement
            $stmt = $this->conn->prepare($query);

            //bind ID
            $stmt->bindParam(1, $this->id);

            //execute query
            $stmt->execute();

            $row = $stmt->fetch(PDO::FETCH_ASSOC);

            //properties
            $this->name = $row['name'];
            $this->email = $row['email'];
            $this->country = $row['country'];
            $this->city = $row['city'];
        }

        //post/create new user
        public function create(){
            // create query
            $query = 'INSERT INTO ' . $this->table . ' SET name = :name, email = :email, ip_address = :ip_address';

            // prepare statement
            $stmt = $this->conn->prepare($query);
  
            // clean data
            $this->name = htmlspecialchars(strip_tags($this->name));
            $this->email = htmlspecialchars(strip_tags($this->email));
            $this->ip_address = htmlspecialchars(strip_tags($this->ip_address));
  
            // bind data
            $stmt->bindParam(':name', $this->name);
            $stmt->bindParam(':email', $this->email);
            $stmt->bindParam(':ip_address', $this->ip_address);
  
            // execute query
            if($stmt->execute()) {
              return true;
            }
  
            //print error if something goes wrong
            printf("Error: %s.\n", $stmt->error);
    
            return false;
        }

    }
?>