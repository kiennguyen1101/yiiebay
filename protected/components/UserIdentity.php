<?php

/**
 * UserIdentity represents the data needed to identity a user.
 * It contains the authentication method that checks if the provided
 * data can identity the user.
 */
class UserIdentity extends CUserIdentity
{

    private $_id;
    /**
     * Authenticates a user.
     * The example implementation makes sure if the username and password
     * are both 'demo'.
     * In practical applications, this should be changed to authenticate
     * against some persistent user identity storage (e.g. database).
     * @return boolean whether authentication succeeds.
     */
    public function authenticate()
    {
        $email = strtolower($this->username);
        $criteria = new CDbCriteria;
        $criteria->together = true;
        $criteria->condition = "user_email = :user_email";
        $criteria->params = array(':user_email' => $email);

        $account = Users::model()->find($criteria);

        if ($account === null) {
            $this->errorCode = self::ERROR_USERNAME_INVALID;
        } elseif (!$this->validatePassword($this->password, $account->user_password)) {
            $this->errorCode = self::ERROR_PASSWORD_INVALID;
        } else {
            $this->errorCode = self::ERROR_NONE;
            $this->_id = $account->id;
            $this->username = $account->user_name;
            $this->setState('attributes',$account->attributes);
        }


        return $this->errorCode == self::ERROR_NONE;
    }

    public function validatePassword($password, $password_repeat)
    {
        //$pass = md5(md5($this->password).Yii::app()->params["salt"]);
        $hash = md5($password);
        return ($hash === $password_repeat);
    }
}