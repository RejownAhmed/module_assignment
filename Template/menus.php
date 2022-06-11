<?php
require __DIR__.'/../Database/conn.php';
require __DIR__ .'/../Models/User.php';


Class Menuitems extends DB
{
    protected $menuItems;
    public $DB;//Read Comments from the Database connection class
 
    public function __construct($package){
        $this->DB = $this->connect();//Use connection in constructor function to work within one connection with database

        $query = $this->DB->query("SELECT `modules` FROM `plans` WHERE `name` = '$package'");
        if ($query->num_rows) { //if there is any data found
            $data = $query->fetch_assoc();
            // Return the array into a variable so that 
            // we cannot call a function each time it loops through. 
            // This way the code is more faster
            $this->menuItems = json_decode($data['modules']); //Decode Json Data to Array(Since we inserted modules id as json object in DB)
            return;

        }

        return "SOMETHING WENT WRONG!";

    }

    public function show(){

        $query = $this->DB->query("SELECT * FROM `modules` WHERE `parent_id`= 0");
        if ($query->num_rows) {

            $html = '<ul>';

            while($module = $query->fetch_assoc())
            {
                if(in_array($module["id"], $this->menuItems)){// Checking if this module has been granted to the user package
                    $html .='<li>'
                                .$module['title'].
                                 $this->menus($module['id']). //Calling its menus
                            '</li>';

                }
            }
            
            $html .= '</ul>';
            echo $html;
            return;
        
        }

    }

    // Show sub menu items of the main menu
    public function menus($id){

        $query = $this->DB->query("SELECT * FROM `modules` WHERE `parent_id`= $id");
        if ($query->num_rows) {

            $html = '<ul>';

            while($menu = $query->fetch_assoc())
            {
                $html .='<li><a href="'
                            .$menu['link']. //menu link
                        '">'
                            .$menu['title']. //menu title/heading
                        '</a>'
                            .$this->menus($menu['id']). //recursive function to generate multilevel menus
                        '</li>'; 
        
            }
            
            $html .= '</ul>';
            if($html != '<ul></ul>'){//If there is at least one menu item
                return $html;
        
            }
        }

    }
}

$user = new User();
$menuItems = new Menuitems($user->package);