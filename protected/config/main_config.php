<?php

// uncomment the following to define a path alias
// Yii::setPathOfAlias('local','path/to/local-folder');
// This is the main Web application configuration. Any writable
// CWebApplication properties can be configured here.

  Yii::setPathOfAlias('bootstrap', dirname(__FILE__) . '/../extensions/bootstrap');

  $config = array(
    'basePath' => dirname(__FILE__) . DIRECTORY_SEPARATOR . '..',
    'name' => 'My Web Application',
    // preloading 'log' component
    'preload' => array('log', 'bootstrap',),
    // autoloading model and component classes
    'import' => array(
      'application.models.*',
      'application.components.*',     
    ),
    'modules' => array(
      // uncomment the following to enable the Gii tool

      'gii' => array(
        'class' => 'system.gii.GiiModule',
        'password' => '123456',
        // If removed, Gii defaults to localhost only. Edit carefully to taste.
        'ipFilters' => array('127.0.0.1', '::1'),
        'generatorPaths' => array(
          'bootstrap.gii',
        ),
      ),
      'admin' => array(
//        'defaultController' => 'AdminDefault',
      ),
      'user',
    ),
    // application components
    'components' => array(
      'bootstrap' => array(
        'class' => 'bootstrap.components.Bootstrap', // assuming you extracted bootstrap under extensions
      ),
      // 'cache' => $cache,
      'user' => array(
        // enable cookie-based authentication
//        'class' => 'RWebUser',
        'allowAutoLogin' => true,
      ),
      // uncomment the following to enable URLs in path-format
      'urlManager' => array(
        'urlFormat' => 'path',
        'showScriptName' => false,
        'rules' => array(
          '<action:(page|contact|login|logout|register)>' => 'site/<action>',
          'admin/<action:(login|index)>' => 'admin/index/<action>',
          '<controller:\w+>/<id:\d+>' => '<controller>/view',
          '<controller:\w+>/<action:\w+>/<id:\d+>' => '<controller>/<action>',
          '<controller:\w+>/<action:\w+>' => '<controller>/<action>',
        ),
      ),
      'db' => array(
        'connectionString' => 'mysql:host=localhost;dbname=yiiblog',
        'schemaCachingDuration' => 3600,
        'emulatePrepare' => true,
        'tablePrefix' => '',
        'username' => 'root',
        'password' => '',
        'charset' => 'utf8',
      ),
      'errorHandler' => array(
        // use 'site/error' action to display errors
        'errorAction' => 'site/error',
      ),
      'log' => array(
        'class' => 'CLogRouter',
        'routes' => array(
          array(
            'class' => 'CFileLogRoute',
            'levels' => 'error, warning',
          ),
          array(
            // 'class'=>'application.extensions.yiidebugtb.XWebDebugRouter',
            'class' => 'ext.yii-debug-toolbar.YiiDebugToolbarRoute',
            'enabled' => false,
            //   'config'=>'alignLeft, opaque, runInDebug, fixedPos, collapsed, yamlStyle',
            'levels' => 'error, warning, trace, profile, info',
          ),
        // uncomment the following to show log messages on web pages
        /*
          array(
          'class'=>'CWebLogRoute',
          ),
         */
        ),
      ),
      'email' => array(
        'class' => 'ext.mailer.EMailer',
        'Host' => 'ssl://smtp.gmail.com',
        'Port' => 465,
        'Username' => 'm.qtpros@gmail.com',
        'Password' => '2761988minh',
        'SMTPDebug' => false,
        'SMTPAuth' => true,
        'SMTPSecure' => true,
        'CharSet' => 'utf-8',
        'ContentType' => 'text/html',
      ),
    ),
    // application-level parameters that can be accessed
    // using Yii::app()->params['paramName']
    'params' => array(
      // this is used in contact page
      'adminEmail' => 'wesbmaster@example.com',
    ),
  );

  return $config;