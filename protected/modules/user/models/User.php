<?php

/**
 * This is the model class for table "User".
 *
 * The followings are the available columns in table 'User':
 * @property string $user_id
 * @property string $user_name
 * @property string $user_password
 * @property string $user_email
 * @property string $user_registered_date
 * @property string $user_activation_key
 * @property integer $user_status
 * @property string $user_displayname
 *
 * The followings are the available model relations:
 * @property Profile[] $profiles
 * @property Usermeta[] $usermetas
 */
class User extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return User the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'User';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('user_name, user_password, user_email', 'required'),
			array('user_status', 'numerical', 'integerOnly'=>true),
			array('user_name, user_password', 'length', 'max'=>32),
			array('user_email', 'length', 'max'=>128),
			array('user_activation_key', 'length', 'max'=>256),
			array('user_displayname', 'length', 'max'=>250),
			array('user_registered_date', 'safe'),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('user_id, user_name, user_password, user_email, user_registered_date, user_activation_key, user_status, user_displayname', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
			'profiles' => array(self::HAS_MANY, 'Profile', 'user_id'),
			'usermetas' => array(self::HAS_MANY, 'Usermeta', 'user_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'user_id' => 'User',
			'user_name' => 'User Name',
			'user_password' => 'User Password',
			'user_email' => 'User Email',
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
	public function search()
	{
		// Warning: Please modify the following code to remove attributes that
		// should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('user_id',$this->user_id,true);
		$criteria->compare('user_name',$this->user_name,true);
		$criteria->compare('user_password',$this->user_password,true);
		$criteria->compare('user_email',$this->user_email,true);
		$criteria->compare('user_registered_date',$this->user_registered_date,true);
		$criteria->compare('user_activation_key',$this->user_activation_key,true);
		$criteria->compare('user_status',$this->user_status);
		$criteria->compare('user_displayname',$this->user_displayname,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
}