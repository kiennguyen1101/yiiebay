<?php

  class IndexController extends AdminDefaultController {

    public $layout = 'column1';

    public function actionIndex() {
      echo "121212";
      if (Yii::app()->user->isGuest)
        $this->redirect($this->createUrl('/admin/login'));
//        var_dump(Yii::app()->user->attributes);
      $this->render('index');
    }

    public function actionLogin() {
      //initialize login form
      $model = new LoginForm('login');

      //processing form
      if (isset($_POST['LoginForm'])) {

        //magic attribute set
        $model->attributes = $_POST['LoginForm'];
        //validate using LoginForm rules
        if ($model->validate()) {
          //call user module to use the models within
          Yii::app()->getModule('user');
          
          $identity = new UserIdentity($model->user_email, $model->user_password);
         
          if ($identity->authenticate()) {
            
            //login this identity for 30 days if rememberMe checked
            $duration = $model->rememberMe ? 3600 * 24 * 30 : 0;    
            Yii::app()->user->login($identity, $duration);
            //redirect to admin main page
            $this->redirect($this->createUrl('/admin/'));
          }
          else {
            $model->addError('user_password', 'incorrect email or password');
          }
        }
      }
      $this->render('login', array('model' => $model));
    }

  }