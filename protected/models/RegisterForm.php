<?php

/**
 * This is the model class for table "yii_users".
 *
 * The followings are the available columns in table 'yii_users':
 * @property string $id
 * @property string $user_name
 * @property string $user_password
 * @property string $user_email
 * @property string $user_registered_date
 * @property string $user_activation_key
 * @property integer $user_status
 * @property string $user_displayname
 *
 * The followings are the available model relations:
 * @property Profiles[] $profiles
 * @property Usermeta[] $usermetas
 */
class RegisterForm extends CActiveRecord {

    public $user_email_repeat;
    public $user_password_repeat;
    public $verifyCode;

    /**
     * Returns the static model of the specified AR class.
     * @param string $className active record class name.
     * @return RegisterForm the static model class
     */
    public static function model($className = __CLASS__) {
        return parent::model($className);
    }

    /**
     * @return string the associated database table name
     */
    public function tableName() {
        return '{{users}}';
    }

    /**
     * @return array validation rules for model attributes.
     */
    public function rules() {
        // NOTE: you should only define rules for those attributes that
        // will receive user inputs.
        return array(
            array('user_password, user_email, verifyCode', 'required',),
            array('user_name, user_password', 'length', 'max' => 32),
            array('user_email', 'email'),
            array('user_email', 'unique'),
            array('user_email', 'compare','compareAttribute' =>'user_email_repeat', 'on' => 'register'),
            array('user_password','compare','on' => 'register'),
            array('user_email', 'length', 'max' => 128),
            array('user_registered_date', 'safe'),
            // The following rule is used by search().
            // Please remove those attributes that should not be searched.
            array('user_name, user_password, user_email, user_activation_key', 'safe', 'on' => 'search'),
            array('user_email_repeat, user_password_repeat', 'safe', 'on' => 'register'),
        );
    }

    /**
     * @return array relational rules.
     */
    public function relations() {
        // NOTE: you may need to adjust the relation name and the related
        // class name for the relations automatically generated below.
        return array(
            'profiles' => array(self::HAS_MANY, 'Profiles', 'user_id'),
            'usermetas' => array(self::HAS_MANY, 'Usermeta', 'user_id'),
        );
    }

    /**
     * @return array customized attribute labels (name=>label)
     */
    public function attributeLabels() {
        return array(
            'id' => 'ID',
            'user_name' => 'User Name',
            'user_password' => 'Password',
            'user_password_repeat' => 'Confirm Password',
            'user_email' => 'Email',
            'user_email_repeat' => 'Confirm Email',
            'user_registered_date' => 'User Registered Date',
            'user_activation_key' => 'User Activation Key',
            'user_status' => 'User Status',
            'user_displayname' => 'User Displayname',
        );
    }

    /**
     * Retrieves a list of models based on the current search/filter conditions.
     * @return CActiveDataProvider the data provider that can return the models based on the search/filter conditions.
     */
    public function search() {
        // Warning: Please modify the following code to remove attributes that
        // should not be searched.

        $criteria = new CDbCriteria;

        $criteria->compare('id', $this->id, true);
        $criteria->compare('user_name', $this->user_name, true);
        $criteria->compare('user_password', $this->user_password, true);
        $criteria->compare('user_email', $this->user_email, true);
        $criteria->compare('user_registered_date', $this->user_registered_date, true);
        $criteria->compare('user_activation_key', $this->user_activation_key, true);
        $criteria->compare('user_status', $this->user_status);
        $criteria->compare('user_displayname', $this->user_displayname, true);

        return new CActiveDataProvider($this, array(
                    'criteria' => $criteria,
                ));
    }

}