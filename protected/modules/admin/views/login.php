<!DOCTYPE html>
<html>

<?php
/* @var $this UsersController */
/* @var $model Users */
/* @var $form CActiveForm */
?>

<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="Content-Type" content="text/html"/>
    <meta name="description" content="Simple Yii Blog"/>
    <meta name="keywords" content="Yii, blog"/>
    <meta name="author" content="kiennguyen1101"/>
    <meta http-equiv="Cache-Control" content="Public">
    <link rel="shortcut icon" href="<?php echo Yii::app()->request->baseUrl; ?>/images/icons/favicon.png">
    <link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/form.css"/>
    <title><?php echo CHtml::encode($this->pageTitle); ?></title>
</head>

<?php Yii::app()->getClientScript()->registerCssFile(Yii::app()->baseUrl . '/css/admin-login.css', 'screen'); ?>
<body>
<div id="login">

    <h1 id="title">Admin Login</h1>

    <div id="login-body">
        <?php $form = $this->beginWidget('CActiveForm', array(
        'id' => 'login_form',
        'enableAjaxValidation' => false,
        'enableClientValidation' => true,
        'clientOptions' => array(
            'validateOnSubmit' => true,
        ),
    )); ?>
        <div class="content-front">

            <div class="pad">

                <p class="note">Fields with <span class="required">*</span> are required.</p>

                <?php echo $form->errorSummary($model); ?>

                <div class="field">
                    <?php echo $form->labelEx($model, 'user_email'); ?>
                    <div>
                        <span class="input">
                        <?php echo $form->textField($model, 'user_email', array('class' => 'text')); ?>
                        </span>
                    </div>

                </div>

                <div class="field">
                    <?php echo $form->labelEx($model, 'user_password'); ?>
                    <div>
                        <span class="input">
                        <?php echo $form->passwordField($model, 'user_password', array('class' => 'text', 'id' => 'login_password')); ?>
                            <a style="" href="javascript:;" id="forgot_my_password">Forgot password?</a>
                        </span>
                    </div>

                </div>

                <div class="checkbox rememberMe">

                    <span class="label">&nbsp;</span>

                    <div>
                        <?php echo $form->checkBox($model, 'rememberMe', array('class' => 'checkbox',)); ?>
                        <?php echo $form->label($model, 'rememberMe'); ?>
                    </div>
                </div>

                <div class="field buttons">
                    <span class="label">&nbsp;</span>

                    <div>
                        <?php echo CHtml::htmlButton('Login', array('class' => 'btn', 'type' => 'submit')); ?>
                    </div>
                </div>
            </div>
        </div>
        <!-- content-front -->
        <?php $this->endWidget(); ?>
    </div>
    <!-- login-body -->


</div>
<!-- login -->
</body>
</html>