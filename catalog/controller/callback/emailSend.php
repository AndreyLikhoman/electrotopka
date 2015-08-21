<?php
if($_POST)
{
  $to_email     = "nopainogain933@gmail.com"; //Recipient email, Replace with own email here
  $from_email   = "noreply@test.eugencode.ru"; //From email address (eg: no-reply@YOUR-DOMAIN.com)
  
    //check if its an ajax request, exit if not
    if(!isset($_SERVER['HTTP_X_REQUESTED_WITH']) AND strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) != 'xmlhttprequest') {
        $output = json_encode(array( //create JSON data
            'type'=>'error',
            'text' => 'Sorry Request must be Ajax POST'
        ));
        die($output); //exit script outputting json data
    }
   
    //Sanitize input data using PHP filter_var().
    $user_name      = filter_var($_POST["user_name"], FILTER_SANITIZE_STRING);
    $user_email     = filter_var($_POST["user_email"], FILTER_SANITIZE_EMAIL);
    $phone_number   = filter_var($_POST["phone_number"], FILTER_SANITIZE_NUMBER_INT);
    $user_theme     = filter_var($_POST["user_theme"], FILTER_SANITIZE_STRING);
    $message = filter_var($_POST["user_msg"], FILTER_SANITIZE_STRING);
    $subject = 'Заявка с сайта electrotopka';
   
   
    //email body
    $message_body = "\r\nИмя: ".$user_name."\r\nE-mail: ".$user_email."\r\nТелефон: ".$phone_number."\r\nТема: ".$user_theme."\r\nСообщение: ".$message;

  ### Attachment Preparation ###
  $file_attached = false;
  if(isset($_FILES['file_attach'])) //check uploaded file
  {
    //get file details we need
    $file_tmp_name    = $_FILES['file_attach']['tmp_name'];
    $file_name      = $_FILES['file_attach']['name'];
    $file_size      = $_FILES['file_attach']['size'];
    $file_type      = $_FILES['file_attach']['type'];
    $file_error     = $_FILES['file_attach']['error'];

    //exit script and output error if we encounter any
    if($file_error>0)
    {
      $mymsg = array( 
      1=>"The uploaded file exceeds the upload_max_filesize directive in php.ini", 
      2=>"The uploaded file exceeds the MAX_FILE_SIZE directive that was specified in the HTML form", 
      3=>"The uploaded file was only partially uploaded", 
      4=>"No file was uploaded", 
      6=>"Missing a temporary folder" ); 
      
      $output = json_encode(array('type'=>'error', 'text' => $mymsg[$file_error]));
      die($output); 
    }
    
    //read from the uploaded file & base64_encode content for the mail
    $handle = fopen($file_tmp_name, "r");
    $content = fread($handle, $file_size);
    fclose($handle);
    $encoded_content = chunk_split(base64_encode($content));
    //now we know we have the file for attachment, set $file_attached to true
    $file_attached = true;
  }
  
  if($file_attached) //continue if we have the file
  {
    # Mail headers should work with most clients
    $headers = "MIME-Version: 1.0\r\n";
    $headers = "X-Mailer: PHP/" . phpversion()."\r\n";
    $headers .= "From: ".$from_email."\r\n";
    $headers .= "Subject: ".$subject."\r\n";
    $headers .= "Reply-To: ".$user_email."" . "\r\n";
    $headers .= "Content-Type: multipart/mixed; boundary=".md5('boundary1')."\r\n\r\n";
    
    $headers .= "--".md5('boundary1')."\r\n";
    $headers .= "Content-Type: multipart/alternative;  boundary=".md5('boundary2')."\r\n\r\n";
    
    $headers .= "--".md5('boundary2')."\r\n";
    $headers .= "Content-Type: text/plain; charset=utf-8\r\n\r\n";
    $headers .= $message_body."\r\n\r\n";
    
    $headers .= "--".md5('boundary2')."--\r\n";
    $headers .= "--".md5('boundary1')."\r\n";
    $headers .= "Content-Type:  ".$file_type."; ";
    $headers .= "name=\"".$file_name."\"\r\n";
    $headers .= "Content-Transfer-Encoding:base64\r\n";
    $headers .= "Content-Disposition:attachment; ";
    $headers .= "filename=\"".$file_name."\"\r\n";
    $headers .= "X-Attachment-Id:".rand(1000,9000)."\r\n\r\n";
    $headers .= $encoded_content."\r\n";
    $headers .= "--".md5('boundary1')."--";
  }else{
    //proceed with PHP email.
    $headers = 'From: '.$user_name.'' . "\r\n" .
    'Reply-To: '.$user_email.'' . "\r\n" .
    'X-Mailer: PHP/' . phpversion();
  }
   
    $send_mail = mail($to_email, $subject, $message_body, $headers);

    if(!$send_mail)
    {
        //If mail couldn't be sent output error. Check your PHP email configuration (if it ever happens)
        $output = json_encode(array('type'=>'error', 'text' => 'Could not send mail! Please check your PHP mail configuration.'));
        die($output);
    }else{
        $output = json_encode(array('type'=>'message', 'text' => 'Hi '.$user_name .' Thank you for your email'));
        die($output);
    }
}
?>
