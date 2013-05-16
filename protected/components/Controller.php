<?php

  /**
   * Controller is the customized base controller class.
   * All controller classes for this application should extend from this base class.
   */
  class Controller extends CController {

    /**
     * @var string the default layout for the controller view. Defaults to '//layouts/column1',
     * meaning using a single column layout. See 'protected/views/layouts/column1.php'.
     */
    public $layout = '//layouts/column2';

    /**
     * @var array context menu items. This property will be assigned to {@link CMenu::items}.
     */
    public $menu = array();

    /**
     * @var array the breadcrumbs of the current page. The value of this property will
     * be assigned to {@link CBreadcrumbs::links}. Please refer to {@link CBreadcrumbs::links}
     * for more details on how to specify this property.
     */
    public $breadcrumbs = array();

    public function beforeRender($view) {
      $cs = Yii::app()->clientScript;
    
      $cs->registerCssFile(
        Yii::app()->assetManager->publish(
          Yii::getPathOfAlias('bootstrap.assets'), false, -1, YII_DEBUG) . '/css/bootstrap.min.css');
      $cs->registerCssFile(
        Yii::app()->assetManager->publish(
          Yii::getPathOfAlias('bootstrap.assets'), false, -1, YII_DEBUG) . '/css/bootstrap-responsive.min.css');
      
      $cs->scriptMap = array_merge($cs->scriptMap, array(
        'jquery.js' => Yii::app()->baseUrl . '/js/jquery1.8.2.min.js',
        'bootstrap.js' => Yii::app()->assetManager->publish(Yii::getPathOfAlias('bootstrap.assets'), false, -1, YII_DEBUG) . '/js/bootstrap.min.js',       
      ));

      $expires = 60 * 60 * 24 * 7; // seconds * minutes * hours * days = 7 days

      /* header("Cache-Control: max-age={$expires}, public, s-maxage={$expires}");
        header("Pragma: ");
        header('Expires: ' . date('D, d M Y H:i:s', time() + $expires) . ' GMT'); */


      return parent::beforeRender($view);
    }

    protected function afterAction($action) {
     
//      Yii::app()->user->setReturnUrl($this->createUrl($this->route, $this->actionParams));
    }

  }