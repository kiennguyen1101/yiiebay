<?php /* @var $this Controller */ ?>
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Content-Type" content="text/html"/>
    <meta name="description" content="Simple Yii Blog"/>
    <meta name="keywords" content="Yii, blog"/>
    <meta name="author" content="kiennguyen1101"/>
    <meta name="viewport" content="width=device-width">


    <link rel="shortcut icon" href="<?php echo Yii::app()->request->baseUrl; ?>/images/icons/favicon.png">

    <link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/form.css"/>

    <title><?php echo CHtml::encode($this->pageTitle); ?></title>
</head>

<body>

<div class="container" id="page">

    <div id="mainmenu" class="page-header">
        <?php


            /* $mainMenu = $this->widget('zii.widgets.CMenu', array(
                'items' => array(
                    array('label' => 'Home', 'url' => array('/')),
                    array('label' => 'About', 'url' => array('site/page', 'view' => 'about')),
                    array('label' => 'Contact', 'url' => array('/contact')),
                    array('label' => 'Register', 'url' => array('/register'), 'visible' => Yii::app()->user->isGuest),
                    array('label' => 'Login', 'url' => array('/login'), 'visible' => Yii::app()->user->isGuest),
                    array('label' => 'Logout (' . Yii::app()->user->name . ')', 'url' => array('/logout'), 'visible' => !Yii::app()->user->isGuest)
                ),
            ),true);*/
            $mainMenu = $this->widget('bootstrap.widgets.TbNavbar', array(
                'type' => 'inverse',
                'brand' => 'Menu',
                'brandUrl' => '#',
                'collapse' => true,
                'fluid' => false,
                'items' => array(
                    array(
                        'class' => 'bootstrap.widgets.TbMenu',
                        'items' => array(
                            array('label' => 'Home', 'url' => array('/')),
                            array('label' => 'About', 'url' => array('site/page', 'view' => 'about')),
                            array('label' => 'Contact', 'url' => array('/contact')),
                            array('label' => 'Register', 'url' => array('/register'), 'visible' => Yii::app()->user->isGuest),
                            array('label' => 'Login', 'url' => array('/login'), 'visible' => Yii::app()->user->isGuest),
                            array('label' => 'Logout (' . Yii::app()->user->name . ')', 'url' => array('/logout'), 'visible' => !Yii::app()->user->isGuest)
                        ),
                    )
                ),
            ), true);

        echo $mainMenu;

        ?>
    </div>

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
            <a href="#"><img src="<?php echo $this->createUrl('/images/icons/fb-logo.png'); ?>" width="40" height="40"
                             alt="" title="facebook"/></a>
            <a href="#"><img src="<?php echo $this->createUrl('/images/icons/twitter-logo.png'); ?>" width="40"
                             height="40" alt="" title="twitter"/></a>
        </div>
        <h1>
            <a name="top" href="#" title="<?php echo CHtml::encode(Yii::app()->name); ?>">
                <img id="logo" src="<?php echo $this->createUrl('/images/marriage-gift-list.png'); ?>"
                     alt="Marriage Gift List" width="345" height="70"/>
            </a>
        </h1>
    </div>
    <!-- header -->
    <!-- mainmenu -->
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
    </div>
    <!-- footer -->

</div>
<!-- page -->

</body>
</html>
