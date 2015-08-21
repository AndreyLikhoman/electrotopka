<?php echo $header; 
$theme_options = $this->registry->get('theme_options');
$config = $this->registry->get('config'); 
include('catalog/view/theme/'.$config->get('config_template').'/template/themeglobal/themeglobal_top_product.tpl'); ?>


 <!-- Выводим атрибут -->
  <?php if ($attribute_groups) { ?>
    <?php foreach ($attribute_groups as $attribute_group) { ?>
      <?php if ($attribute_group['name'] == 'HEADER') { ?>
        <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
           <h1><?php echo html_entity_decode($attribute['text']); ?></h1>
        <?php } ?>
      <?php } ?>
    <?php } ?>
  <?php } ?>
  <!-- Выводим атрибут Конец -->

<div itemscope itemtype="http://data-vocabulary.org/Product">
  <span itemprop="name" class="hidden"><?php echo $heading_title; ?></span>
  <div class="full-product product-info">
  	<div class="prod-row">
  		<div class="col-sm-<?php if($theme_options->get( 'custom_block', 'product_page', $config->get( 'config_language_id' ), 'status' ) == 1) { echo 9; } else { echo 12; } ?>">
  			<div class="row" id="quickview_product">
			    <?php if($theme_options->get( 'product_image_zoom' ) != 2) { ?>
			    <script>
			    	$(document).ready(function(){
			    		<?php if($theme_options->get( 'product_image_zoom' ) == 1) { ?>
			    			$('#image').elevateZoom({
			    				zoomType: "inner",
			    				cursor: "pointer",
			    				zoomWindowFadeIn: 500,
			    				zoomWindowFadeOut: 750
			    			});
			    		<?php } else { ?>
				    		$('#image').elevateZoom({
								zoomWindowFadeIn: 500,
								zoomWindowFadeOut: 500,
								zoomWindowOffetx: 20,
								zoomWindowOffety: -1,
								cursor: "pointer",
								lensFadeIn: 500,
								lensFadeOut: 500,
				    		});
			    		<?php } ?>
			    		
			    		$('.thumbnails a').click(function() {
			    			var smallImage = $(this).attr('data-image');
			    			var largeImage = $(this).attr('data-zoom-image');
			    			var ez =   $('#image').data('elevateZoom');	
			    			$('#ex1').attr('href', largeImage);  
			    			ez.swaptheimage(smallImage, largeImage); 
			    			return false;
			    		});
			    	});
			    </script>
			    <?php } ?>
			  <?php $image_grid = 4; $product_center_grid = 8;    ?>
			    <div class="popup-gallery product-big-image">
			      <div class="row">
			      	  <?php if ($images && $theme_options->get( 'position_image_additional' ) == 2) { ?>
			      	  <div class="col-sm-2">
						<div class="thumbnails thumbnails-left clearfix">
							<ul>
							  <?php if($theme_options->get( 'product_image_zoom' ) != 2 && $thumb) { ?>
						      <li><p><a href="<?php echo $popup; ?>" data-image="<?php echo $thumb; ?>" data-zoom-image="<?php echo $popup; ?>"><img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></p></li>
							  <?php } ?>
						      <?php foreach ($images as $image) { ?>
						      <li><p><a href="<?php echo $image['popup']; ?>" data-image="<?php echo $image['popup']; ?>" data-zoom-image="<?php echo $image['popup']; ?>"><img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></p></li>
						      <?php } ?>
						  </ul>
						</div>
			      	  </div>
			      	  <?php } ?>
			      	  
				      <div class="col-sm-<?php if($theme_options->get( 'position_image_additional' ) == 2) { echo 10; } else { echo 12; } ?>">
				      	<?php if ($thumb) { ?>
					      <div class="product-image <?php if($theme_options->get( 'product_image_zoom' ) != 2) { if($theme_options->get( 'product_image_zoom' ) == 1) { echo 'inner-cloud-zoom'; } else { echo 'cloud-zoom'; } } ?>">
					      	 <?php if($special && $theme_options->get( 'display_text_sale' ) != '0') { ?>
					      	 	<?php $text_sale = 'Sale';
					      	 	if($theme_options->get( 'sale_text', $config->get( 'config_language_id' ) ) != '') {
					      	 		$text_sale = $theme_options->get( 'sale_text', $config->get( 'config_language_id' ) );
					      	 	} ?>
					      	 	<?php if($theme_options->get( 'type_sale' ) == '1') { ?>
					      	 	<?php $product_detail = $theme_options->getDataProduct( $product_id );
					      	 	$roznica_ceny = $product_detail['price']-$product_detail['special'];
					      	 	$procent = ($roznica_ceny*100)/$product_detail['price']; ?>
					      	 	<div class="sale">-<?php echo round($procent); ?>%</div>
					      	 	<?php } else { ?>
					      	 	<div class="sale"><?php echo $text_sale; ?></div>
					      	 	<?php } ?>
					      	 <?php } ?>
					      	 
					     	 <a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" id="ex1"><img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" id="image" itemprop="image" data-zoom-image="<?php echo $popup; ?>" /></a>
					      </div>
					  	 <?php } else { ?>
					  	 <div class="product-image">
					  	 	 <img src="image/no_image.jpg" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" id="image" itemprop="image" />
					  	 </div>
					  	 <?php } ?>
				      </div>
				      
				      <?php if ($images && $theme_options->get( 'position_image_additional' ) != 2) { ?>
				      <div class="col-sm-12">
					      <div class="thumbnails clearfix">
					      	<ul>
					      		<?php if($theme_options->get( 'product_image_zoom' ) != 2 && $thumb) { ?>
					      		<li><p><a href="<?php echo $popup; ?>" data-image="<?php echo $thumb; ?>" data-zoom-image="<?php echo $popup; ?>"><img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></p></li>
					      		<?php } ?>
						        <?php foreach ($images as $image) { ?>
						        <li><p><a href="<?php echo $image['popup']; ?>" data-image="<?php echo $image['popup']; ?>" data-zoom-image="<?php echo $image['popup']; ?>"><img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></p></li>
						        <?php } ?>
					        </ul>
					      </div>
				      </div>
				      <?php } ?>
			      </div>
			    </div>

			    <div class="product-full-description product-center clearfix">
			     <div itemprop="offerDetails" itemscope itemtype="http://data-vocabulary.org/Offer">
				    <?php echo $description; ?>
				 
					<div class="product-price-block">
					<?php if ($price) { ?>
					  <div class="price curr-price">
						Цена: 
						<?php if (!$special) { ?>
						<span class="price-new"><span itemprop="price"><?php echo $price; ?></span></span>
						<?php } else { ?>
						<span class="price-new price-sale"><span itemprop="price"><?php echo $special; ?></span></span> <span class="price-old"><?php echo $price; ?></span>
						<?php } ?>
						
						<?php if ($tax) { ?>
						<!--<span class="price-tax"><?php echo $text_tax; ?> <?php echo $tax; ?></span><br />-->
						<?php } ?>
						<?php if ($points) { ?>
						<span class="reward"><small><?php echo $text_points; ?> <?php echo $points; ?></small></span><br />
						<?php } ?>
						<?php if ($discounts) { ?>
						<br />
						<div class="discount">
						  <?php foreach ($discounts as $discount) { ?>
						  <?php echo $discount['quantity']; ?><?php echo $text_discount; ?><?php echo $discount['price']; ?><br />
						  <?php } ?>
						</div>
						<?php } ?>
					  </div>
					<?php } ?>	
                      <input type="button" value="<?php if($theme_options->get( 'add_to_cart_text', $config->get( 'config_language_id' ) ) != '') { echo $theme_options->get( 'add_to_cart_text', $config->get( 'config_language_id' ) ); } else { echo 'Add to cart'; } ?>" id="button-cart" rel="<?php echo $product_id; ?>" class="add-btn2" />					
					</div>
			      
			     
			     <div id="product" style="display:none !important;">
			      <?php if ($options) { ?>
			      <div class="options">
			        <h2><?php echo $text_option; ?></h2>
			        <?php foreach ($options as $option) { ?>
			        <?php if ($option['type'] == 'select') { ?>
			        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
			          <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
			          <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control">
			            <option value=""><?php echo $text_select; ?></option>
			            <?php foreach ($option['product_option_value'] as $option_value) { ?>
			            <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
			            <?php if ($option_value['price']) { ?>
			            (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
			            <?php } ?>
			            </option>
			            <?php } ?>
			          </select>
			        </div>
			        <?php } ?>
			        <?php if ($option['type'] == 'radio') { ?>
			        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
			          <label class="control-label"><?php echo $option['name']; ?></label>
			          <div id="input-option<?php echo $option['product_option_id']; ?>">
			            <?php foreach ($option['product_option_value'] as $option_value) { ?>
			            <div class="radio">
			              <label>
			                <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
			                <?php echo $option_value['name']; ?>
			                <?php if ($option_value['price']) { ?>
			                (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
			                <?php } ?>
			              </label>
			            </div>
			            <?php } ?>
			          </div>
			        </div>
			        <?php } ?>
			        <?php if ($option['type'] == 'checkbox') { ?>
			        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
			          <label class="control-label"><?php echo $option['name']; ?></label>
			          <div id="input-option<?php echo $option['product_option_id']; ?>">
			            <?php foreach ($option['product_option_value'] as $option_value) { ?>
			            <div class="checkbox">
			              <label>
			                <input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" />
			                <?php echo $option_value['name']; ?>
			                <?php if ($option_value['price']) { ?>
			                (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
			                <?php } ?>
			              </label>
			            </div>
			            <?php } ?>
			          </div>
			        </div>
			        <?php } ?>
			        <?php if ($option['type'] == 'image') { ?>
			        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
			          <label class="control-label"><?php echo $option['name']; ?></label>
			          <div id="input-option<?php echo $option['product_option_id']; ?>">
			            <?php foreach ($option['product_option_value'] as $option_value) { ?>
			            <div class="radio">
			              <label>
			                <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
			                <img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> <?php echo $option_value['name']; ?>
			                <?php if ($option_value['price']) { ?>
			                (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
			                <?php } ?>
			              </label>
			            </div>
			            <?php } ?>
			          </div>
			        </div>
			        <?php } ?>
			        <?php if ($option['type'] == 'text') { ?>
			        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
			          <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
			          <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
			        </div>
			        <?php } ?>
			        <?php if ($option['type'] == 'textarea') { ?>
			        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
			          <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
			          <textarea name="option[<?php echo $option['product_option_id']; ?>]" rows="5" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"><?php echo $option['value']; ?></textarea>
			        </div>
			        <?php } ?>
			        <?php if ($option['type'] == 'file') { ?>
			        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
			          <label class="control-label"><?php echo $option['name']; ?></label>
			          <button type="button" id="button-upload<?php echo $option['product_option_id']; ?>" class="button btn-block"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
			          <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" id="input-option<?php echo $option['product_option_id']; ?>" />
			        </div>
			        <?php } ?>
			        <?php if ($option['type'] == 'date') { ?>
			        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
			          <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
			          <div class="input-group date">
			            <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-format="YYYY-MM-DD" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
			            <span class="input-group-btn">
			            <button class="button" type="button" style="margin-left: 10px;"><i class="fa fa-calendar"></i></button>
			            </span></div>
			        </div>
			        <?php } ?>
			        <?php if ($option['type'] == 'datetime') { ?>
			        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
			          <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
			          <div class="input-group datetime">
			            <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-format="YYYY-MM-DD HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
			            <span class="input-group-btn">
			            <button class="button" type="button" style="margin-left: 10px;"><i class="fa fa-calendar"></i></button>
			            </span></div>
			        </div>
			        <?php } ?>
			        <?php if ($option['type'] == 'time') { ?>
			        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
			          <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
			          <div class="input-group time">
			            <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-format="HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
			            <span class="input-group-btn">
			            <button class="button" type="button" style="margin-left: 10px;"><i class="fa fa-calendar"></i></button>
			            </span></div>
			        </div>
			        <?php } ?>
			        <?php } ?>
			      </div>
			      <?php } ?>
			      
			      <?php if ($recurrings) { ?>
			      <div class="options">
			          <h2><?php echo $text_payment_recurring ?></h2>
			          <div class="form-group required">
			            <select name="recurring_id" class="form-control">
			              <option value=""><?php echo $text_select; ?></option>
			              <?php foreach ($recurrings as $recurring) { ?>
			              <option value="<?php echo $recurring['recurring_id'] ?>"><?php echo $recurring['name'] ?></option>
			              <?php } ?>
			            </select>
			            <div class="help-block" id="recurring-description"></div>
			          </div>
			      </div>
			      <?php } ?>
			      
					
				<div class="cart">
			        <div class="add-to-cart clearfix">
					  <?php if($theme_options->get( 'display_add_to_cart' ) != '0') { ?>	
			          <p><?php echo $entry_qty; ?></p>
			          <div class="quantity">
				          <input type="text" name="quantity" id="quantity_wanted" size="2" value="<?php echo $minimum; ?>" />
				           <a href="#" id="q_up"><i class="fa fa-plus"></i></a>
				          <a href="#" id="q_down"><i class="fa fa-minus"></i></a>
			          </div>
			          <input type="hidden" name="product_id" size="2" value="<?php echo $product_id; ?>" />
			          &nbsp;
					
							<div class="cart-holder">	
								<input type="button" value="<?php if($theme_options->get( 'add_to_cart_text', $config->get( 'config_language_id' ) ) != '') { echo $theme_options->get( 'add_to_cart_text', $config->get( 'config_language_id' ) ); } else { echo 'Add to cart'; } ?>" id="button-cart" rel="<?php echo $product_id; ?>" class="button" />
								<a href="<?php echo "http://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]"; ?>" class="button" id="button-more-details"><?php if($theme_options->get( 'more_details_text', $config->get( 'config_language_id' ) ) != '') { echo html_entity_decode($theme_options->get( 'more_details_text', $config->get( 'config_language_id' ) )); } else { echo 'More details'; } ?></a>
							</div>
						<?php } ?>
						
						<?php if($theme_options->get( 'display_add_to_compare' ) != '0') { ?>
							<div class="compare-holder">
								<a onclick="compare.add('<?php echo $product_id; ?>');" title="<?php if($theme_options->get( 'add_to_compare_text', $config->get( 'config_language_id' ) ) != '') { echo $theme_options->get( 'add_to_compare_text', $config->get( 'config_language_id' ) ); } else { echo 'Add to compare'; } ?>" class="fa  fa-external-link product-icon"></a>
							</div>
						<?php } ?>	
						
						<?php if($theme_options->get( 'display_add_to_wishlist' ) != '0') { ?>
							<div class="wishlist-holder">				
								<a onclick="wishlist.add('<?php echo $product_id; ?>');" title="<?php if($theme_options->get( 'add_to_wishlist_text', $config->get( 'config_language_id' ) ) != '') { echo $theme_options->get( 'add_to_wishlist_text', $config->get( 'config_language_id' ) ); } else { echo 'Add to wishlist'; } ?>" class="fa fa-heart-o product-icon"></a>					
							</div>
						<?php } ?>		
					</div>
							<?php if ($minimum > 1) { ?>
							<div class="minimum"><?php echo $text_minimum; ?></div>
							<?php } ?>
						</div>
			     </div><!-- End #product -->
		    	</div>
		    </div>
    	</div>
    	
    	<?php if($theme_options->get( 'custom_block', 'product_page', $config->get( 'config_language_id' ), 'status' ) == 1) { ?>
    	<div class="col-sm-3">
    		<div class="product-block">
    			<?php if($theme_options->get( 'custom_block', 'product_page', $config->get( 'config_language_id' ), 'heading' ) != '') { ?>
    			<h4 class="title-block"><?php echo $theme_options->get( 'custom_block', 'product_page', $config->get( 'config_language_id' ), 'heading' ); ?></h4>
    			<div class="strip-line"></div>
    			<?php } ?>
    			<div class="block-content">
    				<?php echo html_entity_decode($theme_options->get( 'custom_block', 'product_page', $config->get( 'config_language_id' ), 'text' )); ?>
    			</div>
    		</div>
    	</div>
    	<?php } ?>
    </div>
  </div>
  <?php 
  	  $language_id = $config->get( 'config_language_id' );
	  $tabs = array();
	  
	  $tabs[] = array(
	  	'heading' => $tab_description,
	  	'content' => 'description',
	  	'sort' => 1
	  );
	  
	  if ($attribute_groups) { 
		  $tabs[] = array(
		  	'heading' => $tab_attribute,
		  	'content' => 'attribute',
		  	'sort' => 3
		  );
	  }
	  
	  if ($review_status) { 
	  	  $tabs[] = array(
	  	  	'heading' => $tab_review,
	  	  	'content' => 'review',
	  	  	'sort' => 5
	  	  );
	  }

	  
	  usort($tabs, "cmp_by_optionNumber");
  ?>
  
  
  

  <div class="prod-row">
	  <?php if ($attribute_groups) { ?>
		  <?php foreach ($attribute_groups as $attribute_group) { ?>
				<?php if ($attribute_group['attribute_group_id'] == '7') { ?>
					
					  <div class="prod-prefs">
					  <h6><?php echo $attribute_group['name']; ?> 1 block</h6>
					  <ul>
						<?php foreach ($attribute_group['attribute'] as $attribute) { ?>
						<li>
						  <div class="charact-name"><?php echo $attribute['name']; ?></div>
						  <div class="charact-val"><?php echo $attribute['text']; ?></div>
						</li>
						<?php } ?>
					  </ul>
					  </div>
				<?php } ?>

				<?php if ($attribute_group['attribute_group_id'] == '3') { ?>
					  <div class="prod-charact">
					  <h6><?php echo $attribute_group['name']; ?> 2 block</h6>
					  <ul>
						<?php foreach ($attribute_group['attribute'] as $attribute) { ?>
						<li>
						  <div class="charact-name"><?php echo $attribute['name']; ?></div>
						  <div class="charact-val"><?php echo $attribute['text']; ?></div>
						</li>
						<?php } ?>
					  </ul>
					  </div>
				<?php } ?>				
		  	
		  <?php } ?>
	  <?php } ?>
  </div>
  
  

 

<?php if($theme_options->get( 'product_scroll_related' ) != '0') { ?>
<script type="text/javascript">
$(document).ready(function() {
  var owl<?php echo $id; ?> = $(".box #myCarousel<?php echo $id; ?> .carousel-inner");
	
  $("#myCarousel<?php echo $id; ?>_next").click(function(){
      owl<?php echo $id; ?>.trigger('owl.next');
      return false;
    })
  $("#myCarousel<?php echo $id; ?>_prev").click(function(){
      owl<?php echo $id; ?>.trigger('owl.prev');
      return false;
  });
    
  owl<?php echo $id; ?>.owlCarousel({
  	  slideSpeed : 500,
      singleItem:true
   });
});
</script>
<?php } ?>
<script type="text/javascript"><!--
$('select[name=\'recurring_id\'], input[name="quantity"]').change(function(){
	$.ajax({
		url: 'index.php?route=product/product/getRecurringDescription',
		type: 'post',
		data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
		dataType: 'json',
		beforeSend: function() {
			$('#recurring-description').html('');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();
			
			if (json['success']) {
				$('#recurring-description').html(json['success']);
			}
		}
	});
});
//--></script> 
<script type="text/javascript"><!--
$('#button-cart').on('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
		dataType: 'json',
		success: function(json) {
			$('.alert, .text-danger').remove();
			$('.form-group').removeClass('has-error');

			if (json['error']) {
				if (json['error']['option']) {
					for (i in json['error']['option']) {
						var element = $('#input-option' + i.replace('_', '-'));
						
						if (element.parent().hasClass('input-group')) {
							element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						} else {
							element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						}
					}
				}
				
				if (json['error']['recurring']) {
					$('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
				}
				
				// Highlight any found errors
				$('.text-danger').parent().addClass('has-error');
			}
			
			if (json['success']) {
					themeglobalNotification(json['product_name'], json['product_pic'], json['success'], 'success');
					$('#cart').load('index.php?route=common/cart/info #cart > *');
					$('#cart-total').html(json['total']);
				}
		}
	});
});//--></script> 
<script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});

$('.datetime').datetimepicker({
	pickDate: true,
	pickTime: true
});

$('.time').datetimepicker({
	pickDate: false
});
		
$('button[id^=\'button-upload\']').on('click', function() {
	var node = this;
	
	$('#form-upload').remove();
	
	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');
	
	$('#form-upload input[name=\'file\']').trigger('click');
	
	$('#form-upload input[name=\'file\']').on('change', function() {
		$.ajax({
			url: 'index.php?route=tool/upload',
			type: 'post',
			dataType: 'json',
			data: new FormData($(this).parent()[0]),
			cache: false,
			contentType: false,
			processData: false,
			beforeSend: function() {
				$(node).button('loading');
			},
			complete: function() {
				$(node).button('reset');
			},
			success: function(json) {
				$('.text-danger').remove();
				
				if (json['error']) {
					$(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
				}
				
				if (json['success']) {
					alert(json['success']);
					
					$(node).parent().find('input').attr('value', json['code']);
				}
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	});
});
//--></script> 
<script type="text/javascript"><!--
$('#review').delegate('.pagination a', 'click', function(e) {
	e.preventDefault();
	
    $('#review').fadeOut('slow');
        
    $('#review').load(this.href);
    
    $('#review').fadeIn('slow');
});         

$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

$('#button-review').on('click', function() {
    $.ajax({
        url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
        type: 'post',
        dataType: 'json',
        data: 'name=' + encodeURIComponent($('input[name=\'name\']').val()) + '&text=' + encodeURIComponent($('textarea[name=\'text\']').val()) + '&rating=' + encodeURIComponent($('input[name=\'rating\']:checked').val() ? $('input[name=\'rating\']:checked').val() : '') + '&captcha=' + encodeURIComponent($('input[name=\'captcha\']').val()),
        beforeSend: function() {
            $('#button-review').button('loading');
        },
        complete: function() {
            $('#button-review').button('reset');
            $('#captcha').attr('src', 'index.php?route=tool/captcha#'+new Date().getTime());
            $('input[name=\'captcha\']').val('');
        },
        success: function(json) {
			$('.alert-success, .alert-danger').remove();
            
			if (json['error']) {
                $('#review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
            }
            
            if (json['success']) {
                $('#review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');
                                
                $('input[name=\'name\']').val('');
                $('textarea[name=\'text\']').val('');
                $('input[name=\'rating\']:checked').prop('checked', false);
                $('input[name=\'captcha\']').val('');
            }
        }
    });
});
</script>

<script type="text/javascript"><!--
$(document).ready(function() {
	$('.popup-gallery').magnificPopup({
		delegate: 'a',
		type: 'image',
		tLoading: 'Loading image #%curr%...',
		mainClass: 'mfp-img-mobile',
		gallery: {
			enabled: true,
			navigateByImgClick: true,
			preload: [0,1] // Will preload 0 - before current, and 1 after the current image
		},
		image: {
			tError: '<a href="%url%">The image #%curr%</a> could not be loaded.',
			titleSrc: function(item) {
				return item.el.attr('title');
			}
		}
	});
});
//--></script> 

<script type="text/javascript">
$.fn.tabs = function() {
	var selector = this;
	
	this.each(function() {
		var obj = $(this); 
		
		$(obj.attr('href')).hide();
		
		$(obj).click(function() {
			$(selector).removeClass('selected');
			
			$(selector).each(function(i, element) {
				$($(element).attr('href')).hide();
			});
			
			$(this).addClass('selected');
			
			$($(this).attr('href')).show();
			
			return false;
		});
	});

	$(this).show();
	
	$(this).first().click();
};
</script>

<script type="text/javascript"><!--
$('#tabs a').tabs();
//--></script> 

<script>
 $(function(){
    $('.prod-row div.prod-charact:first-child').attr('class', 'prod-prefs');
 });
</script>

<?php if($theme_options->get( 'product_image_zoom' ) != 2) { 
echo '<script type="text/javascript" src="catalog/view/theme/' . $config->get( 'config_template' ) . '/js/jquery.elevateZoom-3.0.3.min.js"></script>';
} ?>


<?php include('catalog/view/theme/'.$config->get('config_template').'/template/themeglobal/themeglobal_bottom.tpl'); ?>

<div class="container">
 <?php if ($products) { ?>
  <?php 
  $class = 3; 
  $id = rand(0, 5000)*rand(0, 5000); 
  $all = 4; 
  $row = 4; 
  
  if($theme_options->get( 'product_per_pow2' ) == 6) { $class = 2; }
  if($theme_options->get( 'product_per_pow2' ) == 5) { $class = 25; }
  if($theme_options->get( 'product_per_pow2' ) == 3) { $class = 4; }
  
  if($theme_options->get( 'product_per_pow2' ) > 1) { $row = $theme_options->get( 'product_per_pow2' ); $all = $theme_options->get( 'product_per_pow2' ); } 
  ?>
  <div class="box">
    <?php if($theme_options->get( 'product_scroll_related' ) != '0') { ?>
    <!-- Carousel nav -->
		<?php $i = 0; foreach ($products as $product) { $i++; ?><?php } ?>
				<a class="next-button" href="#myCarousel<?php echo $id; ?>" id="myCarousel<?php echo $id; ?>_next"><span></span></a>
				<a class="prev-button" href="#myCarousel<?php echo $id; ?>" id="myCarousel<?php echo $id; ?>_prev"><span></span></a>
    <?php } ?>
  	
    <div class="box-heading">Похожие модели электрокотлов</div>
    <div class="box-content products related-products hidden-xs">
      <div class="box-product">
      	<div id="myCarousel<?php echo $id; ?>" <?php if($theme_options->get( 'product_scroll_related' ) != '0') { ?>class="carousel slide"<?php } ?>>
      		<!-- Carousel items -->
      		<div class="carousel-inner">
      			<?php $i = 0; $row_fluid = 0; $item = 0; foreach ($products as $product) { $row_fluid++; ?>
  	    			<?php if($i == 0) { $item++; echo '<div class="active item"><div class="product-grid"><div class="row">'; } ?>
  	    			<?php $r=$row_fluid-floor($row_fluid/$all)*$all; if($row_fluid>$all && $r == 1) { if($theme_options->get( 'product_scroll_related' ) != '0') { echo '</div></div></div><div class="item"><div class="product-grid"><div class="row">'; $item++; } else { echo '</div><div class="row">'; } } else { $r=$row_fluid-floor($row_fluid/$row)*$row; if($row_fluid>$row && $r == 1) { echo '</div><div class="row">'; } } ?>
  	    			<div class="col-sm-<?php echo $class; ?>">
  	    				<?php include('catalog/view/theme/'.$config->get('config_template').'/template/themeglobal/product.tpl'); ?>
  	    			</div>
      			<?php $i++; } ?>
      			<?php if($i > 0) { echo '</div></div></div>'; } ?>
      		</div>
  		</div>
      </div>
    </div>
	<?php $all = 4;$row = 4;  ?>
	<!-- For Mobiles view -->
	<div class="box-content products related-products visible-xs">
      <div class="box-product">
      	<div id="myCarousel<?php echo $id; ?>" <?php if($theme_options->get( 'product_scroll_related' ) != '0') { ?>class="carousel slide"<?php } ?>>
      		<!-- Carousel items -->
      		<div class="carousel-inner">
      			<?php $i = 0; $row_fluid = 0; $item = 0; foreach ($products as $product) { $row_fluid++; ?>
  	    			<?php if($i == 0) { $item++; echo '<div class="active item"><div class="product-grid"><div class="row">'; } ?>
  	    			<?php $r=$row_fluid-floor($row_fluid/$all)*$all; if($row_fluid>$all && $r == 1) { if($theme_options->get( 'product_scroll_related' ) != '0') { echo '</div></div></div><div class="item"><div class="product-grid"><div class="row">'; $item++; } else { echo '</div><div class="row">'; } } else { $r=$row_fluid-floor($row_fluid/$row)*$row; if($row_fluid>$row && $r == 1) { echo '</div><div class="row">'; } } ?>
  	    			<div class="col-xs-6">
  	    				<?php include('catalog/view/theme/'.$config->get('config_template').'/template/themeglobal/product.tpl'); ?>
  	    			</div>
      			<?php $i++; } ?>
      			<?php if($i > 0) { echo '</div></div></div>'; } ?>
      		</div>
  		</div>
      </div>
    </div>
	<div class="btns-text">
		<a href="/katalog-produktsii-c59.html">Вернуться в каталог</a> или <button type="button" class="text-btn" data-toggle="modal"  data-target="#callModal">Заказать консультацию</button>
	</div>
  </div>
  <?php } ?>
</div>
</div>
<?php echo $footer; ?>