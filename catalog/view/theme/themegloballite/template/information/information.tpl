<?php echo $header; 
$theme_options = $this->registry->get('theme_options');
$config = $this->registry->get('config'); 
include('catalog/view/theme/'.$config->get('config_template').'/template/themeglobal/themeglobal_top.tpl'); ?>

<?php echo $description; ?>

<?php include('catalog/view/theme/'.$config->get('config_template').'/template/themeglobal/themeglobal_bottom.tpl'); ?>
<?php echo $footer; ?>