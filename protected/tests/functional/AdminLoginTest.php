<?php
  /**
   * Description of AdminLoginTest
   *       Testing admin login:
    User forgot to enter one or more fields
    User enter invalid email address
    User is not an admin
    User is an admin but with invalid session (?)
    User is an admin with valid session (?)
   *
   * @author Kien
   */
  
  define('TEST_URL','http://localhost/yiiblog/');
  
  class AdminLoginTest extends CWebTestCase2 {

    public function setUp() {
      parent::setUp();     
      $this->setHost('localhost');
      $this->setPort(4444);
      $this->setBrowser('firefox');
      $this->setBrowserUrl(TEST_URL);
    }

    public function testHasLoginForm() {
     
      $this->url('admin/login');
      
      $email = $this->byName('user_email');

      $this->assertEquals('', $email->value());
    }

  }

  