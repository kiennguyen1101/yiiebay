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
    public $layout = '//layouts/column1';

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

        $cs->scriptMap = array(
            'jquery.js' => 'http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js',
        );
        
        $expires = 60 * 60 * 24 * 7;   // seconds * minutes * hours * days = 7 days
        
        header("Cache-Control: max-age={$expires}, public, s-maxage={$expires}");
        header("Pragma: ");
        header('Expires: ' . date('D, d M Y H:i:s', time() + $expires) . ' GMT');


        return parent::beforeRender($view);
    }
    

}