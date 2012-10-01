<?php /* @var $this Controller */ ?>
<?php $this->beginContent('/layouts/main-admin'); ?>

<div class="container-fluid">
    <div class="row-fluid">
        <div class="well span2">
            <?php $this->widget('bootstrap.widgets.TbMenu', array(
            'type'=>'list',
            'items'=>array(
                array('label'=>'Home', 'icon'=>'home', 'url'=> array('/admin'), 'active'=>true),
                array('label'=>'Manage users', 'icon'=>'user', 'url'=>array('/admin/user')),
            ),
        )); ?>
        </div>
        <div class="span9">
            <?php echo $content; ?>
        </div>

        <div class="span1">
            <div id="sidebar">
                <?php
                $this->beginWidget('zii.widgets.CPortlet', array(
                    'title'=>'Operations',
                ));
                $this->widget('zii.widgets.CMenu', array(
                    'items'=>$this->menu,
                    'htmlOptions'=>array('class'=>'operations'),
                ));
                $this->endWidget();
                ?>
            </div><!-- sidebar -->
        </div>

    </div>
</div>

<?php $this->endContent(); ?>