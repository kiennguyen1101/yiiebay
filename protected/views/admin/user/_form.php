<?php
/* @var $this UserController */
/* @var $model Users */
/* @var $form CActiveForm */
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'users-form',
	'enableAjaxValidation'=>false,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php echo $form->errorSummary($model); ?>

	<div class="row">
		<?php echo $form->labelEx($model,'user_name'); ?>
		<?php echo $form->textField($model,'user_name',array('size'=>32,'maxlength'=>32)); ?>
		<?php echo $form->error($model,'user_name'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'user_password'); ?>
		<?php echo $form->textField($model,'user_password',array('size'=>32,'maxlength'=>32)); ?>
		<?php echo $form->error($model,'user_password'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'user_email'); ?>
		<?php echo $form->textField($model,'user_email',array('size'=>60,'maxlength'=>128)); ?>
		<?php echo $form->error($model,'user_email'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'user_registered_date'); ?>
		<?php echo $form->textField($model,'user_registered_date'); ?>
		<?php echo $form->error($model,'user_registered_date'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'user_activation_key'); ?>
		<?php echo $form->textField($model,'user_activation_key',array('size'=>60,'maxlength'=>256)); ?>
		<?php echo $form->error($model,'user_activation_key'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'user_status'); ?>
		<?php echo $form->textField($model,'user_status'); ?>
		<?php echo $form->error($model,'user_status'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'user_displayname'); ?>
		<?php echo $form->textField($model,'user_displayname',array('size'=>60,'maxlength'=>250)); ?>
		<?php echo $form->error($model,'user_displayname'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->