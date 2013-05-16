<?php

  /** @var BootActiveForm $form */
  Yii::app()->clientScript->registerCssFile(
    Yii::app()->getAssetManager()->publish(
      Yii::getPathOfAlias('admin.assets.css') . '/admin-login.css'));

  $form = $this->beginWidget('bootstrap.widgets.TbActiveForm', array(
    'id' => 'verticalForm',
    'enableAjaxValidation' => false,
    'enableClientValidation' => true,
    'clientOptions' => array(
      'validateOnSubmit' => true,
    ),
    'htmlOptions' => array('class' => 'form-signin'),
  ));
?>
<?php echo $form->errorSummary($model); ?>
<?php echo $form->labelEx($model, 'user_email'); ?>
<?php echo $form->textField($model, 'user_email', array('class' => 'span3')); ?>
<?php echo $form->labelEx($model, 'user_password'); ?>
<?php echo $form->passwordField($model, 'user_password', array('class' => 'span3')); ?>
<?php echo $form->checkboxRow($model, 'rememberMe'); ?>
<?php

  $this->widget('bootstrap.widgets.TbButton', array(
    'buttonType' => 'submit', 'label' => 'Login', 'type' => 'primary', 'size' => 'large'));
?>

<?php $this->endWidget(); ?>
