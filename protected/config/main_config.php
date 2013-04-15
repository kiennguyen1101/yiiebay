<?php

// uncomment the following to define a path alias
// Yii::setPathOfAlias('local','path/to/local-folder');
// This is the main Web application configuration. Any writable
// CWebApplication properties can be configured here.

$use_memcache = false;
$cache = array(
    'class' => 'system.caching.CMemCache',
    'servers' => array(
        array(
            'host' => '192.168.192.128',
            'port' => 11211,
        ),
    ),
);
if (class_exists('Memcache')) {
    $memcache = new Memcache();
    foreach ($cache['servers'] as $server => $info) {
        if (@$memcache->connect($info['host'], $info['port'])) {
            $use_memcache = true;
            break;
        }
    }
}

if (!$use_memcache) {
    $cache = array(
        'class' => 'system.caching.CFileCache',
    );
} else {
    $hash = md5_file(dirname(__FILE__) . '/main_config.php');
    if ($hash == $memcache->get('yiiblog_config_hash')) {
        $config = $memcache->get('yiiblog_config');
        if (!is_null($config)) {
            $config = unserialize($config);
            // var_dump($config);
            return $config;
        }
    }
}

$config = array(
    'basePath' => dirname(__FILE__) . DIRECTORY_SEPARATOR . '..',
    'name' => 'My Web Application',
    // preloading 'log' component
    'preload' => array('log', 'bootstrap',),
    // autoloading model and component classes
    'import' => array(
        'application.models.*',
        'application.components.*',
        'application.modules.rights.*',
        'application.modules.rights.components.*',   // Correct paths if necessary.
    ),
    'modules' => array(
        // uncomment the following to enable the Gii tool
        'admin' => array(
            'components' => array(
                'user' => array(
                    'loginUrl' => array('/admin/login'),
                ),
            ),
        ),

        'gii' => array(
            'class' => 'system.gii.GiiModule',
            'password' => '1',
            // If removed, Gii defaults to localhost only. Edit carefully to taste.
            'ipFilters' => array('127.0.0.1', '::1'),
            'generatorPaths' => array(
                'bootstrap.gii',
            ),
        ),

        'rights'=>array(
            'userClass' => 'Users',
            'userNameColumn'=>'user_name',     // Name of the user name column in the database.
            'appLayout'=>'application.views.layouts.main-site',  // Application layout.
            'install'=>false,        // Whether to install rights.
            'debug'=>true,        // Whether to enable debug mode.
        ),
    ),
    // application components
    'components' => array(
        'authManager' => array(
            'class'=>'RDbAuthManager',
            'connectionID'=>'db', // as in your database configuraiton
            'itemTable'=>'authitem',
            'itemChildTable'=>'authitemchild',
            'assignmentTable'=>'authassignment',
            'rightsTable'=>'rights',

        ),
        'bootstrap' => array(
            'class' => 'ext.bootstrap.components.Bootstrap', // assuming you extracted bootstrap under extensions
        ),
        'cache' => $cache,
        'user' => array(
            // enable cookie-based authentication
            'class'=>'RWebUser',
            'allowAutoLogin' => true,
        ),
        // uncomment the following to enable URLs in path-format

        'urlManager' => array(
            'urlFormat' => 'path',
            'showScriptName' => false,
            'rules' => array(
                '<controller:\w+>/<id:\d+>' => '<controller>/view',
                '<controller:\w+>/<action:\w+>/<id:\d+>' => '<controller>/<action>',
                '<controller:\w+>/<action:\w+>' => '<controller>/<action>',
                '<action:(page|contact|login|logout|register)>' => 'site/<action>',
            ),
        ),

        'db' => array(
            'connectionString' => 'mysql:host=localhost;dbname=yiiblog',
            'schemaCachingDuration' => 3600,
            'emulatePrepare' => true,
            'tablePrefix' => 'yii_',
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

if ($use_memcache) {
    $memcache->set('yiiblog_config', serialize($config), false, 600);
    $memcache->set('yiiblog_config_hash', $hash, false, 600);
}


return $config;