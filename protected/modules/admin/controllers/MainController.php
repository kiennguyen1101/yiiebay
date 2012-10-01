<?php
/**
 * Created by: Kien
 * Date: 9/29/12 11:37 PM
 * To change this template use File | Settings | File Templates.
 */
class MainController extends DefaultController
{
    public function actionIndex()
    {

//        var_dump(Yii::app()->user->attributes);
        $this->render('/index');
    }
}
