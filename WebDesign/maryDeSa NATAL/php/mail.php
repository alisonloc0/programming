<?php


        $name = htmlspecialchars(trim($_POST['nome']), ENT_QUOTES, 'UTF-8' );
        $email = htmlspecialchars(trim($_POST['email']), ENT_QUOTES, 'UTF-8' );
		  $msg = htmlspecialchars(trim($_POST['mensagem']), ENT_QUOTES, 'UTF-8' );
			
        $to_emails = "maryasas@gmail.com,contato@marydesa.com,alison.aloc@gmail.com";
        
        $subject = 'Uma nova mensagem de ' . $name.' foi enviada';

		  $message = "Temos uma nova mensagens para você!\n\n";
        $message .= "De: {$name}\n";
        $message .= "Email: {$email}\n";
        $message .= "Mensagem: {$msg}\n";
        
        $headers = "From: Marydesa\r\n";
        $headers .= "Reply-To: {$email}\r\n";
        $headers .= 'X-Mailer: PHP/' . phpversion();

        mail($to_emails, $subject, $message, $headers);

?>
