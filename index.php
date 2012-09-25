<?php

// change the following paths if necessary
$yii = dirname(__FILE__) . '/../yii/framework/yiilite.php';
$config = dirname(__FILE__) . '/protected/config/main_config.php';

// remove the following lines when in production mode
defined('YII_DEBUG') or define('YII_DEBUG', true);
if (YII_DEBUG === true) {
    ini_set('display_errors', true);
    error_reporting(E_ALL ^ E_NOTICE);
}
// specify how many levels of call stack should be shown in each log message
defined('YII_TRACE_LEVEL') or define('YII_TRACE_LEVEL', 3);

require_once($yii);
Yii::createWebApplication($config)->run();


	