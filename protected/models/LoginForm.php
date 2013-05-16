<?php

  /**
   * LoginForm class.
   * LoginForm is the data structure for keeping
   * user login form data. It is used by the 'login' action of 'SiteController'.
   */
  class LoginForm extends CFormModel {

    public $user_email;
    public $user_password;
    public $rememberMe;

    /**
     * Declares the validation rules.
     * The rules state that username and password are required,
     * and password needs to be authenticated.
     */
    public function rules() {
      return array(
        // username and password are required
        array('user_email, user_password', 'required'),
        array('user_email', 'email', 'message' => 'Please enter a valid email'),
        // rememberMe needs to be a boolean
        array('rememberMe', 'boolean'),
      );
    }

    /**
     * Declares attribute labels.
     */
    public function attributeLabels() {
      return array(
        'user_email' => 'Email',
        'user_password' => 'Password',
        'rememberMe' => 'Remember me next time',
      );
    }

  }

  