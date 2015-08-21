<?php echo $header; 
$theme_options = $this->registry->get('theme_options');
$config = $this->registry->get('config');  ?>

<!-- <p><?php echo $text_error; ?></p> -->
<img src="image/404.png" width="438" height="227" alt="Ошибка 404" style="display: block; margin: 30px auto;"><br>
<?
include('catalog/view/theme/'.$config->get('config_template').'/template/themeglobal/themeglobal_404.tpl');
?>

<p>К сожалению, запрашиваемая Вами страница не найдена...</p><br>
<p>Почему?</p><br>
<ol style="padding-left: 15px;">
<li>Ссылка, по которой Вы пришли, неверна.
<li>Вы неправильно указали путь или название страницы.
<li>Страница была удалёна со времени Вашего последнего посещения.
</ol><br>
<p>Для продолжения работы с сайтом Вы можете перейти на <a href="/">Главную страницу сайта.</a></p><br>
<div class="buttons">
  <div class="pull-right"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
</div>
  
 <?php include('catalog/view/theme/'.$config->get('config_template').'/template/themeglobal/themeglobal_bottom.tpl'); ?>
<?php echo $footer; ?>