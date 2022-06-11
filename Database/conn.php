<?php

Class DB{
    private $servername = "localhost";
    private $username = "root";
    private $password = "";
    private $dbname = "module_assignment";

    public function connect(){

      $conn = new mysqli($this->servername, $this->username, $this->password, $this->dbname);
    
      if($conn->connect_error){
        die("Connection failed: ".$conn->connect_error);
      }
      
      return $conn;
    }


}


//!<<<::::====MUST READ BELOW COMMENTS FOR BETTER UNDERSTANDING OF PHP CLASSES====::::>>>
/* When you are using Static methods- $this keyword won't work, instead use self 
   but when using self you must declare the whole variable. See below exmaple:- 
*/

/*<::===Declaration===::>*/
//* public $hello;

/*<::===Use===::>*/
//* $this->hello; self::$hello. */ 
// TODO: Remember to use dollor sign when using self keyword.
