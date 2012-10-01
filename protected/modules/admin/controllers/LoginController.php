<?php
/**
 * Created by: Kien
 * Date: 9/30/12 12:23 AM
 * To change this template use File | Settings | File Templates.
 */
class LoginController extends DefaultController
{
    public function actionIndex() {
        $model = new LoginForm('login');

        if (isset($_POST['LoginForm'])) {

            $model->attributes = $_POST['LoginForm'];
            if ($model->validate()) {

                $identity = new UserIdentity($model->user_email, $model->user_password);


                if ($identity->authenticate()) {
                    $duration = $model->rememberMe ? 3600 * 24 * 30 : 0; // 30 days
                    Yii::app()->user->login($identity, $duration);
                    $this->redirect(Yii::app()->user->returnUrl);
                } else {
                    $model->addError('user_password', 'incorrect email or password');
                }


            }
        }

        $this->layout = '';
        $cs = Yii::app()->clientScript;
        //  var_dump($cs->isCssFileRegistered(Yii::app()->assetManager->publish(Yii::getPathOfAlias('bootstrap.assets'), false, -1, YII_DEBUG).'/css/bootstrap.css'));
        $cs->registerCoreScript('yiiactiveform');
        $cs->scriptMap = array_merge($cs->scriptMap, array('bootstrap.css' => false, 'bootstrap-yii.css' => false, 'bootstrap.js' => false));
        $this->render('/login', array('model' => $model));

    }
}
