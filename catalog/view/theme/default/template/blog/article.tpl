<?php echo $header; ?>
<div class="breadcrumb">
	<div class="container">
		  <ul>
			<?php $count = count($breadcrumbs);?>
				<?php $i=0; ?>
				<?php foreach ($breadcrumbs as $breadcrumb) { ?>
					<?php if( $i == $count-1){ ?>
					   <li><?php echo $breadcrumb['text']; ?></li>
					<?php }else{ ?>
					<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
				<?php } ?>      

				<?php $i++; ?> 
			<?php } ?>
		  </ul>
	</div>
</div>

<h1 id="title-page"><?php echo $heading_title; ?></h1>

<div class="container">
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <div class="row">
        <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-9'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-12'; ?>
        <?php } ?>
        <div class="<?php echo $class; ?>">
            <div class="full-news">
                <p><?php echo $description; ?></p>
            </div>
        </div>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>
