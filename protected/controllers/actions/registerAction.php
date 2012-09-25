<?php

class RegisterAction extends CAction {

    public $salt;

    public function run() {

        $model = new RegisterForm('register');

        $request = Yii::app()->request;
        $model->attributes = $request->getPost('RegisterForm', $model->attributes);

        // uncomment the following code to enable ajax-based validation

        if ($request->getIsAjaxRequest()) {
            echo CActiveForm::validate(array($model));
            Yii::app()->end();
        }


        if (isset($_POST['RegisterForm'])) {
            if ($model->validate()) {
                // form inputs are valid, do something here

                $mail = Yii::app()->email;
                $mail->SetFrom('name@yourdomain.com', 'First Last');

                //to
                $mail->AddAddress($model->user_email, $model->user_displayname);

                //subject and body
                $mail->Subject = "Your email verification code for localhost";
                $mail->AltBody = "To view the message, please use an HTML compatible email viewer!";
                // Retrieve the email template for registration

//                $model->save(false);
//                // Retrieve the email template for registration
//                $message = $this->controller->renderPartial('/email_templates/register', null, true);
//
//                // Replace the content with the actual information
//                $message = str_replace('%verificationCode%', $verificationCode, $message);
//                $message = str_replace('%url%', $url, $message);
//
//                $mail->MsgHTML($message);
//                if ($mail->Send()) {
//
//                }

                $this->controller->redirect('/');
            }
        }

        $this->controller->render('register', array(
            'model' => $model,
        ));
    }

}