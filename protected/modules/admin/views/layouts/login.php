<!DOCTYPE html>
<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta http-equiv="Content-Type" content="text/html"/>
  <meta name="description" content="Simple Yii Blog"/>
  <meta name="keywords" content="Yii, blog"/>
  <meta name="author" content="kiennguyen1101"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <link rel="shortcut icon" href="<?php echo Yii::app()->request->baseUrl; ?>/images/icons/favicon.png">
  <link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/form.css"/>
  <title><?php echo CHtml::encode($this->pageTitle); ?></title>

</head>
<body>
  <div id="page" class="container-fluid">   
    <?php echo $content; ?>
  </div>
</body>


</html>

