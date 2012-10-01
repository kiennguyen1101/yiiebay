<!DOCTYPE html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Content-Type" content="text/html"/>
    <meta name="description" content="Simple Yii Blog"/>
    <meta name="keywords" content="Yii, blog"/>
    <meta name="author" content="kiennguyen1101"/>
    <meta name="viewport" content="width=device-width">
    <meta http-equiv="Cache-Control" content="private">


    <link rel="shortcut icon" href="<?php echo Yii::app()->request->baseUrl; ?>/images/icons/favicon.png">
    <link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/form.css"/>
    <title>Admin page</title>

</head>
<body>
<div class="page-header" >
    <?php
    $mainMenu = $this->widget('bootstrap.widgets.TbNavbar', array(
    'type' => 'inverse',
    'brand' => 'Dashboard',
    'brandUrl' => array('/admin/'),
    'collapse' => true,
    'fluid' => false,
    'items' => array(
        array(
            'class' => 'bootstrap.widgets.TbMenu',
            'items' => array(
                array('label' => 'Home', 'url' => array('/')),
                array('label' => 'Logout (' . Yii::app()->user->attributes['user_displayname'] . ')', 'url' => array('/logout'), 'visible' => !Yii::app()->user->isGuest)
            ),
        )
    ),
    'htmlOptions' => array(
    ),
), true);
    echo $mainMenu;
    ?>


</div>
<?php echo $content; ?>

<footer>
    <p>© Company 2012</p>
</footer>
</body>


</html>

