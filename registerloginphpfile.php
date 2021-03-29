<?php
        
        $con = mysqli_connect("localhost","root","","testlogin") or die('unable to connect-1');
   $request = $_POST['request'];
    
    if ($request == 'register')
    
    {
        
	    $username = $_POST['username'];
	    $password = $_POST['password'];
        
        $stmt = "INSERT INTO users (username, password) VALUES ('".$username."','".$password."')";
        
       if($stmt->execute()){
           $response['message']='registration success..';
       }else{
           $response['message']='registration failed..';
       }
        echo json_encode($response);
    }
    else if ($request == "login"){
      $username = $_POST['username'];
	    $password = $_POST['password'];
      
      $stmt = "SELECT * FROM users WHERE username = '".$username."' And password = '".$password."'";

      $stmt->execute();

      if ($stmt-> rowCount() == 0){
        $response['error']= true;
        $response['message']= 'failed';

      }else{
        $response['error']= false;
        $response['message']= 'success';
      }

      echo json_encode($response);


    }
    ?>