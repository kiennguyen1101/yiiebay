<?php

class DefaultController extends Controller
{

    public $pageTitle = '';

    /**
     * @var array - array of {@link CBreadCrumbs} link
     */
    public $breadcrumbs = array();

    public $layout = "column2";
    public $layoutPath = "protected/modules/admin/views/layouts";

    public function init()
    {
        $this->pageTitle = Yii::app()->name;
        Yii::app()->user->loginUrl=array('/admin/login');
        parent::init();
    }



   /* protected function beforeAction($action) {
        if (Yii::app()->user->isGuest)
            $this->redirect($this->createUrl('/admin/login'));
    }*/

}