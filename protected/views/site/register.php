<?php
/* @var $this RegisterFormController */
/* @var $model RegisterForm */
/* @var $form CActiveForm */
?>

<div class="form">

    <?php
    $form = $this->beginWidget('CActiveForm', array(
        'id' => 'register-form-register-form',
        'enableAjaxValidation' => true,
        'enableClientValidation' => true,
        'clientOptions' => array(
            'validateOnSubmit' => true,
        ),
            ));
    ?>

    <p class="note">Fields with <span class="required">*</span> are required.</p>

    <?php echo $form->errorSummary($model); ?>

    <div class="row">
        <?php echo $form->labelEx($model, 'user_email'); ?>
        <?php echo $form->textField($model, 'user_email'); ?>
        <?php echo $form->error($model, 'user_email'); ?>
    </div>

    <div class="row">
        <?php echo $form->labelEx($model, 'user_email_repeat'); ?>
        <?php echo $form->textField($model, 'user_email_repeat'); ?>
        <?php echo $form->error($model, 'user_email_repeat', '', false); ?>
    </div>

    <div class="row">
        <?php echo $form->labelEx($model, 'user_password'); ?>
        <?php echo $form->passwordField($model, 'user_password'); ?>
        <?php echo $form->error($model, 'user_password', '', false); ?>
    </div>

    <div class="row">
        <?php echo $form->labelEx($model, 'user_password_repeat'); ?>
        <?php echo $form->passwordField($model, 'user_password_repeat'); ?>
        <?php echo $form->error($model, 'user_password_repeat', '', false); ?>
    </div>

    <?php if (CCaptcha::checkRequirements()): ?>
        <div class="row">
            <?php echo $form->labelEx($model, 'verifyCode'); ?>
            <div>
                <?php $this->widget('CCaptcha'); ?>
                <?php echo $form->textField($model, 'verifyCode'); ?>
            </div>
            <div class="hint">Please enter the letters as they are shown in the image above.
                <br/>Letters are not case-sensitive.</div>
            <?php echo $form->error($model, 'verifyCode', '', false); ?>
        </div>
    <?php endif; ?>

    <div class="row buttons">
        <?php echo CHtml::submitButton('Submit'); ?>
    </div>

    <?php $this->endWidget(); ?>

</div><!-- form -->