<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->id),array('view','id'=>$data->id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('user_name')); ?>:</b>
	<?php echo CHtml::encode($data->user_name); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('user_password')); ?>:</b>
	<?php echo CHtml::encode($data->user_password); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('user_email')); ?>:</b>
	<?php echo CHtml::encode($data->user_email); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('user_registered_date')); ?>:</b>
	<?php echo CHtml::encode($data->user_registered_date); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('user_activation_key')); ?>:</b>
	<?php echo CHtml::encode($data->user_activation_key); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('user_status')); ?>:</b>
	<?php echo CHtml::encode($data->user_status); ?>
	<br />

	<?php /*
	<b><?php echo CHtml::encode($data->getAttributeLabel('user_displayname')); ?>:</b>
	<?php echo CHtml::encode($data->user_displayname); ?>
	<br />

	*/ ?>

</div>