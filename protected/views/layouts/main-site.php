<?php /* @var $this Controller */ ?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="Content-Type" content="text/html" />
        <meta name="description" content="Simple Yii Blog" />
        <meta name="keywords" content="Yii, blog" />
        <meta name="author" content="kiennguyen1101" />
        <meta http-equiv="Cache-Control" content="Public">

        <link rel="shortcut icon" href="<?php echo Yii::app()->request->baseUrl; ?>/images/favicon.png">
        <!-- blueprint CSS framework -->
        <link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/screen.css" media="screen, projection" />
        <link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/print.css" media="print" />
        <!--[if lt IE 8]>
        <link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/ie.css" media="screen, projection" />
        <![endif]-->

        <link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/main.css" />
        <!-- <link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/form.css" /> -->

        <title><?php echo CHtml::encode($this->pageTitle); ?></title>
    </head>

    <body>

        <div class="container" id="page">

            <div id="header">
                <div id="countryswitch">
                    <div id="currentcountry">
                        <img src="<?php echo $this->createUrl('/images/icons/uk.png'); ?>" alt="UK" width="16" height="11"/>
                        <a href="#">UK Version</a>
                    </div>
                    <div id="switchcountry">
                        <img src="<?php echo $this->createUrl('/images/icons/us.png'); ?>" alt="US" width="16" height="11"/>
                        <a href="#">US Version</a>
                    </div>
                </div>
                <div id="socialboxes">
                    <a href="#"><img src="<?php echo $this->createUrl('/images/icons/fb-logo.png'); ?>" width="40" height="40" alt="" title="facebook" /></a>
                    <a href="#"><img src="<?php echo $this->createUrl('/images/icons/twitter-logo.png'); ?>" width="40" height="40" alt="" title="twitter" /></a>
                </div>
                <h1>
                    <a name="top" href="#" title="<?php echo CHtml::encode(Yii::app()->name); ?>"><img id="logo" src="<?php echo $this->createUrl('/images/marriage-gift-list.png'); ?>" alt="Marriage Gift List" width="345" height="70"/></a>
                </h1>
            </div><!-- header -->

            <div id="mainmenu">
                <?php

                $value=Yii::app()->cache->get($id);

               $mainMenu = $this->widget('zii.widgets.CMenu', array(
                    'items' => array(
                        array('label' => 'Home', 'url' => array('/')),
                        array('label' => 'About', 'url' => array('site/page', 'view' => 'about')),
                        array('label' => 'Contact', 'url' => array('/contact')),
                        array('label' => 'Register', 'url' => array('/register'), 'visible' => Yii::app()->user->isGuest),
                        array('label' => 'Login', 'url' => array('/login'), 'visible' => Yii::app()->user->isGuest),
                        array('label' => 'Logout (' . Yii::app()->user->name . ')', 'url' => array('/logout'), 'visible' => !Yii::app()->user->isGuest)
                    ),
                ),true);

               echo $mainMenu;


                ?>
            </div><!-- mainmenu -->
            <?php if (isset($this->breadcrumbs)): ?>
                <?php
                $this->widget('zii.widgets.CBreadcrumbs', array(
                    'links' => $this->breadcrumbs,
                ));
                ?><!-- breadcrumbs -->
            <?php endif ?>

            <?php echo $content; ?>

            <div class="clear"></div>

            <div id="footer">
                Copyright &copy; <?php echo date('Y'); ?> by My Company.<br/>
                All Rights Reserved.<br/>
                <?php echo Yii::powered(); ?>
            </div><!-- footer -->

        </div><!-- page -->

    </body>
</html>
