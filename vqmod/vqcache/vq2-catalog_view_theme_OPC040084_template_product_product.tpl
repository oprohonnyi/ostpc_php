<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?> 
  <div class="breadcrumb" xmlns:v="<?php echo $http_type;?>//rdf.data-vocabulary.org/#" id="brd-crumbs"  >
  
	<ul>
		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
			<li typeof="v:Breadcrumb">
			<?php echo $breadcrumb['separator']; ?><a property="v:title" rel="v:url" href="<?php echo $breadcrumb['href']; ?>"><span><?php echo $breadcrumb['text']; ?></span></a></li>
    	<?php } ?>
	</ul>
  </div>
  
    <div class="product-info" itemscope itemtype="http://schema.org/Product">
    <?php if ($thumb || $images) { ?>
    <div class="left product-image">
      <?php if ($thumb) { ?>      
	  <!-- Megnor Cloud-Zoom Image Effect Start -->
	  	<span class="image"><img id="cloud-zoom" src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" data-zoom-image="<?php echo $popup; ?>"/></span> 
      <?php } ?>
      <?php if ($images) { ?>	  
	  	 <?php 
			$sliderFor = 3;
			$imageCount = sizeof($images); 
		 ?>	
		 <div class="additional-carousel">	
		  <?php if ($imageCount >= $sliderFor): ?>
		  	<div class="customNavigation">
				<a class="btn prev">&nbsp;</a>
				<a class="btn next">&nbsp;</a>
			</div> 
		  <?php endif; ?>	      
		  <div id="additional-carousel" class="image-additional <?php if ($imageCount >= $sliderFor){?>product-carousel<?php }?>">
    	    <?php foreach ($images as $image) { ?>
				<div class="slider-item">
				<div class="product-block">		
        			<a href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" class="elevatezoom-gallery" data-image="<?php echo $image['thumb']; ?>" data-zoom-image="<?php echo $image['popup']; ?>"><img id="cloud-zoom" src="<?php echo $image['thumb']; ?>" width="74" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a>
				</div>
				</div>		
	        <?php } ?>				
    	  </div>
		 
		  <span class="additional_default_width" style="display:none; visibility:hidden"></span>
		  </div>		  	  
	  
    <?php } ?>
	 <script>	  	  			
		$("#cloud-zoom").elevateZoom({ <?php if ($images) { ?>gallery:'additional-carousel', <?php } ?>	 cursor: 'pointer', galleryActiveClass: 'active', imageCrossfade: true, loadingIcon: 'catalog/view/theme/<?php echo $this->config->get('config_template') ?>/image/megnor/spinner.gif'}); 	
				
			$("#cloud-zoom").bind("click", function(e) {   
				var ez =   $('#cloud-zoom').data('elevateZoom');	
				$.fancybox(ez.getGalleryList()); 
				return false; 
			});  
			
	</script> 
	<!-- Megnor Cloud-Zoom Image Effect End-->	
	
    </div>
    <?php } ?>
    <div class="right">
	   <h1 class="item name fn" itemprop="name"><?php echo $heading_title; ?></h1> 	   
		<div class="description">
		<table class="product-description"> <!-- Megnor <table> Start -->	
        <?php if ($manufacturer) { ?>
			<tr><td><span><?php echo $text_manufacturer; ?></span></td><td class="description-right"><a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a></td></tr>
        <?php } ?>
	        <tr><td><span><?php echo $text_model; ?></span></td><td class="description-right"><?php echo $model; ?></td></tr>
        <?php if ($reward) { ?>
    	    <tr><td><span><?php echo $text_reward; ?></span></td><td class="description-right"><?php echo $reward; ?></td></tr>
        <?php } ?>
        	<tr><td><span><?php echo $text_stock; ?></span></td><td class="description-right"><?php echo $stock; ?></td></tr>
		</table>	<!-- Megnor <table> End -->	
		</div>
		
      <?php if ($price) { ?>
      <div class="price"><?php echo $text_price; ?>
        <?php if (!$special) { ?>
        <span id="formated_price" price="<?php echo $price_value; ?>"><?php echo $price; ?></span>
        <?php } else { ?>
        <span id="formated_price" class="price-old" price="<?php echo $price_value; ?>"><?php echo $price; /**/ ?></span> <span class="price-new"><span id="formated_special" price="<?php echo $special_value; ?>"><?php echo $special; /**/ ?></span></span>
        <?php } ?>
        
        <?php if ($tax) { ?>
        <span class="price-tax"><?php echo $text_tax; ?> <span id="formated_tax" price="<?php echo $tax_value; ?>"><?php echo $tax; ?></span></span><br />
        <?php } ?>
        <?php if ($points) { ?>
        <span class="reward"><small><?php echo $text_points; ?> <span id="formated_points" points="<?php echo $points; /**/ ?>"><?php echo $points; /**/ ?></span></small></span><br />
        <?php } ?>
        <?php if ($discounts) { ?>
        <br />
        <div class="discount">
          <?php foreach ($discounts as $discount) { ?>
          <?php echo sprintf($text_discount, $discount['quantity'], $discount['price']); ?><br />
          <?php } ?>
        </div>
        <?php } ?>
      </div>
      <?php } ?>
      <?php if ($profiles): ?>
      <div class="option">
          <h2><span class="required">*</span><?php echo $text_payment_profile ?></h2>
          <br />
          <select name="profile_id">
                
              <?php foreach ($profiles as $profile): ?>
              <option value="<?php echo $profile['profile_id'] ?>"><?php echo $profile['name'] ?></option>
              <?php endforeach; ?>
          </select>
          <br />
          <br />
          <span id="profile-description"></span>
          <br />
          <br />
      </div>
      <?php endif; ?>
      <?php if ($options) { ?>
      <div class="options" id="product_options">
        <h2><?php echo $text_option; ?></h2>
		        
        <?php foreach ($options as $option) { ?>
        <?php if ($option['type'] == 'select') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?>
          <b><?php echo $option['name']; ?>:</b><br />
          <select name="option[<?php echo $option['product_option_id']; ?>]" onchange="recalculateprice();">
              
<?php $opt_checked="checked"; ?>
            <?php foreach ($option['option_value'] as $option_value) { ?>
            <option value="<?php echo $option_value['product_option_value_id']; ?>"  points="<?php echo $option_value['points_value']; ?>" price_prefix="<?php echo $option_value['price_prefix']; ?>" price="<?php echo $option_value['price_value']; ?>"><?php echo $option_value['name']; ?>
            <?php if ($option_value['price']) { ?>
            
        
          <?php
          if ($option_value['price_prefix'] == '*') {
            if ($option_value['price_value'] != 1.0)
              printf("(%+d%%)", round(($option_value['price_value'] * 100) - 100) );
          } else {
            echo "(".$option_value['price_prefix'].$option_value['price'].")"; 
          }
          ?>
        
      
            <?php } ?>
            </option>
            <?php } ?>
          </select>
        </div>
        <br />
        <?php } ?>
        <?php if ($option['type'] == 'radio') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?>
          <b><?php echo $option['name']; ?>:</b><br />
<?php $opt_checked="checked"; ?>
          <?php foreach ($option['option_value'] as $option_value) { ?>
          <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]"  points="<?php echo $option_value['points_value']; ?>" price_prefix="<?php echo $option_value['price_prefix']; ?>" price="<?php echo $option_value['price_value']; ?>" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" <?php echo $opt_checked; $opt_checked=""; ?> onchange="recalculateprice();" />
          <label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
            <?php if ($option_value['price']) { ?>
            
        
          <?php
          if ($option_value['price_prefix'] == '*') {
            if ($option_value['price_value'] != 1.0)
              printf("(%+d%%)", round(($option_value['price_value'] * 100) - 100) );
          } else {
            echo "(".$option_value['price_prefix'].$option_value['price'].")"; 
          }
          ?>
        
      
            <?php } ?>
          </label>
          <br />
          <?php } ?>
        </div>
        <br />
        <?php } ?>
        <?php if ($option['type'] == 'checkbox') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?>
          <b><?php echo $option['name']; ?>:</b><br />
<?php $opt_checked="checked"; ?>
          <?php foreach ($option['option_value'] as $option_value) { ?>
          <input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]"  points="<?php echo $option_value['points_value']; ?>" price_prefix="<?php echo $option_value['price_prefix']; ?>" price="<?php printf("%.5f", $option_value['price_value']); ?>" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" onchange="recalculateprice();" />
          <label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
            <?php if ($option_value['price']) { ?>
            
        
          <?php
          if ($option_value['price_prefix'] == '*') {
            if ($option_value['price_value'] != 1.0)
              printf("(%+d%%)", round(($option_value['price_value'] * 100) - 100) );
          } else {
            echo "(".$option_value['price_prefix'].$option_value['price'].")"; 
          }
          ?>
        
      
            <?php } ?>
          </label>
          <br />
          <?php } ?>
        </div>
        <br />
        <?php } ?>
        <?php if ($option['type'] == 'image') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?>
          <b><?php echo $option['name']; ?>:</b><br />
          <table class="option-image">
<?php $opt_checked="checked"; ?>
            <?php foreach ($option['option_value'] as $option_value) { ?>
            <tr>
              <td style="width: 1px;"><input type="radio" name="option[<?php echo $option['product_option_id']; ?>]"  points="<?php echo $option_value['points_value']; ?>" price_prefix="<?php echo $option_value['price_prefix']; ?>" price="<?php echo $option_value['price_value']; ?>" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" <?php echo $opt_checked; $opt_checked=""; ?> onchange="recalculateprice();" /></td>
              <td><label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" /></label></td>
              <td><label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                  <?php if ($option_value['price']) { ?>
                  
        
          <?php
          if ($option_value['price_prefix'] == '*') {
            if ($option_value['price_value'] != 1.0)
              printf("(%+d%%)", round(($option_value['price_value'] * 100) - 100) );
          } else {
            echo "(".$option_value['price_prefix'].$option_value['price'].")"; 
          }
          ?>
        
      
                  <?php } ?>
                </label></td>
            </tr>
            <?php } ?>
          </table>
        </div>
        <br />
        <?php } ?>
        <?php if ($option['type'] == 'text') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?>
          <b><?php echo $option['name']; ?>:</b><br />
          <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" />
        </div>
        <br />
        <?php } ?>
        <?php if ($option['type'] == 'textarea') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?>
          <b><?php echo $option['name']; ?>:</b><br />
          <textarea name="option[<?php echo $option['product_option_id']; ?>]" cols="40" rows="5"><?php echo $option['option_value']; ?></textarea>
        </div>
        <br />
        <?php } ?>
        <?php if ($option['type'] == 'file') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?>
          <b><?php echo $option['name']; ?>:</b><br />
          <input type="button" value="<?php echo $button_upload; ?>" id="button-option-<?php echo $option['product_option_id']; ?>" class="button">
          <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" />
        </div>
        <br />
        <?php } ?>
        <?php if ($option['type'] == 'date') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?>
          <b><?php echo $option['name']; ?>:</b><br />
          <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="date" />
        </div>
        <br />
        <?php } ?>
        <?php if ($option['type'] == 'datetime') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?>
          <b><?php echo $option['name']; ?>:</b><br />
          <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="datetime" />
        </div>
        <br />
        <?php } ?>
        <?php if ($option['type'] == 'time') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?>
          <b><?php echo $option['name']; ?>:</b><br />
          <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="time" />
        </div>
        <br />
        <?php } ?>
        <?php } ?>
      </div>
      <?php } ?>
      <div class="cart">
        <div><?php echo $text_qty; ?>
          <input type="text" name="quantity" id="product_buy_quantity" oninput="recalculateprice();"  size="2" value="<?php echo $minimum; ?>" />
          <input type="hidden" name="product_id" size="2" value="<?php echo $product_id; ?>" />
          &nbsp;
          <input type="button" value="<?php echo $button_cart; ?>" id="button-cart" class="button" />
          <span>&nbsp;&nbsp;<?php echo $text_or; ?>&nbsp;&nbsp;</span>
          <span class="links">
		  <a onclick="addToWishList('<?php echo $product_id; ?>');" class="product_wishlist"><?php echo $button_wishlist; ?></a> 
            <a onclick="addToCompare('<?php echo $product_id; ?>');" class="product_compare"><?php echo $button_compare; ?></a></span>
        </div>
        <?php if ($minimum > 1) { ?>
        <div class="minimum"><?php echo $text_minimum; ?></div>
        <?php } ?>
      </div>
	  
      <div class="review">
      	<?php if ($review_status) { ?>
        	<div itemscope itemtype="http://schema.org/AggregateRating"><img itemprop="ratingValue" src="catalog/view/theme/<?php echo $this->config->get('config_template') ?>/image/stars-<?php echo $rating; ?>.png" alt="<?php echo $reviews; ?>" />&nbsp;&nbsp;<a itemprop="reviewCount" onclick="$('a[href=\'#tab-review\']').trigger('click');" ><?php echo $reviews; ?></a>&nbsp;&nbsp;&nbsp;&nbsp <a onclick="$('a[href=\'#tab-review\']').trigger('click');" class="review-write"><?php echo $text_write; ?></a></div>        
		<?php } ?>
		<div class="share">
            <!-- Go to www.addthis.com/dashboard to customize your tools -->
            <div class="addthis_sharing_toolbox"></div>
        </div>
      </div>
    </div>
  </div>
  <div id="tabs" class="htabs"><a href="#tab-description"><?php echo $tab_description; ?></a>
    <?php if ($attribute_groups) { ?>
    <a href="#tab-attribute"><?php echo $tab_attribute; ?></a>
    <?php } ?>
    <?php if ($review_status) { ?>
    <a href="#tab-review"><?php echo $tab_review; ?></a>
    <?php } ?>
  </div>
  <div id="tab-description" class="tab-content"><?php echo $description; ?></div>
  <?php if ($attribute_groups) { ?>
  <div id="tab-attribute" class="tab-content">
    <table class="attribute">
      <?php foreach ($attribute_groups as $attribute_group) { ?>
      <thead>
        <tr>
          <td colspan="2"><?php echo $attribute_group['name']; ?></td>
        </tr>
      </thead>
      <tbody>
        <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
        <tr>
          <td><?php echo $attribute['name']; ?></td>
          <td><?php echo $attribute['text']; ?></td>
        </tr>
        <?php } ?>
      </tbody>
      <?php } ?>
    </table>
  </div>
  <?php } ?>
  <?php if ($review_status) { ?>
  <div id="tab-review" class="tab-content">
    <div id="review"></div>
    <h2 id="review-title"><?php echo $text_write; ?></h2>
    <label><?php echo $entry_name; ?></label>
    <input type="text" name="name" value="" class="entry_name" />
    <br />
    <br />
    <label><?php echo $entry_review; ?></label>
    <textarea name="text" cols="40" rows="8" style="width: 98%;"></textarea>
    <span style="font-size: 11px;"><?php echo $text_note; ?></span><br />
    <br />
    <label class="entery_rating"><?php echo $entry_rating; ?></label> <span><?php echo $entry_bad; ?></span>&nbsp;
    <input type="radio" name="rating" value="1" />
    &nbsp;
    <input type="radio" name="rating" value="2" />
    &nbsp;
    <input type="radio" name="rating" value="3" />
    &nbsp;
    <input type="radio" name="rating" value="4" />
    &nbsp;
    <input type="radio" name="rating" value="5" />
    &nbsp;<span><?php echo $entry_good; ?></span><br />
    <br />
    <label class="entery_captcha"><?php echo $entry_captcha; ?></label>
    <input type="text" name="captcha" value="" class="captch_input" />
    <img src="index.php?route=product/product/captcha" alt="" id="captcha" /><br />
    <br />
    <div class="buttons">
      <div class="right"><a id="button-review" class="button"><?php echo $button_continue; ?></a></div>
    </div>
  </div>
  <?php } ?>
  <?php if ($products) { ?>
  
  <div class="box">
  <div class="box-heading">
  <?php echo $tab_related; ?> (<?php echo count($products); ?>) 
  </div>
  <div id="products-related" class="related-products">
	<!-- Megnor Related Products Start -->
	<?php 
		$sliderFor = 5;
		$productCount = sizeof($products); 
	?>
	<div class="box-content">
	<?php if ($productCount >= $sliderFor): ?>
		<div class="customNavigation">
			<a class="btn prev">&nbsp;</a>
			<a class="btn next">&nbsp;</a>
		</div>	
	<?php endif; ?>	
	
	<div class="box-product <?php if ($productCount >= $sliderFor){?>product-carousel<?php }else{?>productbox-grid<?php }?>" id="<?php if ($productCount >= $sliderFor){?>related-carousel<?php }else{?>related-grid<?php }?>">
      <?php foreach ($products as $product) { ?>
      <div class="<?php if ($productCount >= $sliderFor){?>slider-item<?php }else{?>product-items<?php }?>">
	  <div class="product-block">
	  <div class="product-block-inner">
        <?php if ($product['thumb']) { ?>
        <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
        <?php } ?>
        <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
        <?php if ($product['price']) { ?>
        <div class="price">
          <?php if (!$product['special']) { ?>
          <?php echo $product['price']; ?>
          <?php } else { ?>
          <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
          <?php } ?>
        </div>
        <?php } ?>
        <?php if ($product['rating']) { ?>
        <div class="rating"><img src="catalog/view/theme/<?php echo $this->config->get('config_template') ?>/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></div>
        <?php } ?>
        <a onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button"><?php echo $button_cart; ?></a>
	</div></div></div>
      <?php } ?>
    </div>
	<span class="related_default_width" style="display:none; visibility:hidden"></span>
	<!-- Megnor Related Products Start -->	
  </div>
  </div>
  </div>
  <?php } ?>
  <?php if ($tags && $tags[0]["tag"] != "") { ?>
  <div class="tags product-info-tags"><b><?php echo $text_tags; ?></b>
    <?php for ($i = 0; $i < count($tags); $i++) { ?>
    <?php if ($i < (count($tags) - 1)) { ?>
    <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>,
    <?php } else { ?>
    <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
    <?php } ?>
    <?php } ?>
  </div>
  <?php } ?>
  <?php echo $content_bottom; ?></div>
<script type="text/javascript"><!--
$(document).ready(function() {
	$('.colorbox').colorbox({
		overlayClose: true,
		opacity: 0.5,
		rel: "colorbox"
	});
});
//--></script> 
<script type="text/javascript"><!--

$('select[name="profile_id"], input[name="quantity" id="product_buy_quantity" oninput="recalculateprice();" ]').change(function(){
    $.ajax({
		url: 'index.php?route=product/product/getRecurringDescription',
		type: 'post',
		data: $('input[name="product_id"], input[name="quantity" id="product_buy_quantity" oninput="recalculateprice();" ], select[name="profile_id"]'),
		dataType: 'json',
        beforeSend: function() {
            $('#profile-description').html('');
        },
		success: function(json) {
			$('.success, .warning, .attention, information, .error').remove();
            
			if (json['success']) {
                $('#profile-description').html(json['success']);
			}	
		}
	});
});
    
$('#button-cart').bind('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: $('.product-info input[type=\'text\'], .product-info input[type=\'hidden\'], .product-info input[type=\'radio\']:checked, .product-info input[type=\'checkbox\']:checked, .product-info select, .product-info textarea'),
		dataType: 'json',
		success: function(json) {
			$('.success, .warning, .attention, information, .error').remove();
			
			if (json['error']) {
				if (json['error']['option']) {
					for (i in json['error']['option']) {
						$('#option-' + i).after('<span class="error">' + json['error']['option'][i] + '</span>');
					}
				}
                
                if (json['error']['profile']) {
                    $('select[name="profile_id"]').after('<span class="error">' + json['error']['profile'] + '</span>');
                }
			} 
			
			if (json['success']) {
				$('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');
					
				$('.success').fadeIn('slow');
					
				$('#cart-total').html(json['total']);
				
				$('html, body').animate({ scrollTop: 0 }, 'slow'); 
			}	
		}
	});
});
//--></script>
<?php if ($options) { ?>
<script type="text/javascript" src="catalog/view/javascript/jquery/ajaxupload.js"></script>
<?php foreach ($options as $option) { ?>
<?php if ($option['type'] == 'file') { ?>
<script type="text/javascript"><!--
new AjaxUpload('#button-option-<?php echo $option['product_option_id']; ?>', {
	action: 'index.php?route=product/product/upload',
	name: 'file',
	autoSubmit: true,
	responseType: 'json',
	onSubmit: function(file, extension) {
		$('#button-option-<?php echo $option['product_option_id']; ?>').after('<img src="catalog/view/theme/default/image/loading.gif" class="loading" style="padding-left: 5px;" />');
		$('#button-option-<?php echo $option['product_option_id']; ?>').attr('disabled', true);
	},
	onComplete: function(file, json) {
		$('#button-option-<?php echo $option['product_option_id']; ?>').attr('disabled', false);
		
		$('.error').remove();
		
		if (json['success']) {
			alert(json['success']);
			
			$('input[name=\'option[<?php echo $option['product_option_id']; ?>]\']').attr('value', json['file']);
		}
		
		if (json['error']) {
			$('#option-<?php echo $option['product_option_id']; ?>').after('<span class="error">' + json['error'] + '</span>');
		}
		
		$('.loading').remove();	
	}
});
//--></script>
<?php } ?>
<?php } ?>
<?php } ?>
<script type="text/javascript"><!--
$('#review .pagination a').live('click', function() {
	$('#review').fadeOut('slow');
		
	$('#review').load(this.href);
	
	$('#review').fadeIn('slow');
	
	return false;
});			

$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

$('#button-review').bind('click', function() {
	$.ajax({
		url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
		type: 'post',
		dataType: 'json',
		data: 'name=' + encodeURIComponent($('input[name=\'name\']').val()) + '&text=' + encodeURIComponent($('textarea[name=\'text\']').val()) + '&rating=' + encodeURIComponent($('input[name=\'rating\']:checked').val() ? $('input[name=\'rating\']:checked').val() : '') + '&captcha=' + encodeURIComponent($('input[name=\'captcha\']').val()),
		beforeSend: function() {
			$('.success, .warning').remove();
			$('#button-review').attr('disabled', true);
			$('#review-title').after('<div class="attention"><img src="catalog/view/theme/default/image/loading.gif" alt="" /> <?php echo $text_wait; ?></div>');
		},
		complete: function() {
			$('#button-review').attr('disabled', false);
			$('.attention').remove();
		},
		success: function(data) {
			if (data['error']) {
				$('#review-title').after('<div class="warning">' + data['error'] + '</div>');
			}
			
			if (data['success']) {
				$('#review-title').after('<div class="success">' + data['success'] + '</div>');
								
				$('input[name=\'name\']').val('');
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']:checked').attr('checked', '');
				$('input[name=\'captcha\']').val('');
			}
		}
	});
});
//--></script> 
<script type="text/javascript"><!--
$('#tabs a').tabs();
//--></script> 
<script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-timepicker-addon.js"></script> 
<script type="text/javascript"><!--
$(document).ready(function() {
	if ($.browser.msie && $.browser.version == 6) {
		$('.date, .datetime, .time').bgIframe();
	}

	$('.date').datepicker({dateFormat: 'yy-mm-dd'});
	$('.datetime').datetimepicker({
		dateFormat: 'yy-mm-dd',
		timeFormat: 'h:m'
	});
	$('.time').timepicker({timeFormat: 'h:m'});
});
//--></script> 

        
<script type="text/javascript"><!--

function price_format(n)
{ 
    c = <?php echo (empty($currency['decimals']) ? "0" : $currency['decimals'] ); ?>;
    d = '<?php echo $currency['decimal_point']; ?>'; // decimal separator
    t = '<?php echo $currency['thousand_point']; ?>'; // thousands separator
    s_left = '<?php echo $currency['symbol_left']; ?>';
    s_right = '<?php echo $currency['symbol_right']; ?>';
      
    n = n * <?php echo $currency['value']; ?>;

    //sign = (n < 0) ? '-' : '';

    //extracting the absolute value of the integer part of the number and converting to string
    i = parseInt(n = Math.abs(n).toFixed(c)) + ''; 

    j = ((j = i.length) > 3) ? j % 3 : 0; 
    return s_left + (j ? i.substr(0, j) + t : '') + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + t) + (c ? d + Math.abs(n - i).toFixed(c).slice(2) : '') + s_right; 
}

function calculate_tax(price)
{
    <?php // Process Tax Rates
      if (isset($tax_rates) && $tax) {
         foreach ($tax_rates as $tax_rate) {
           if ($tax_rate['type'] == 'F') {
             echo 'price += '.$tax_rate['rate'].';';
           } elseif ($tax_rate['type'] == 'P') {
             echo 'price += (price * '.$tax_rate['rate'].') / 100.0;';
           }
         }
      }
    ?>
    return price;
}

function process_discounts(price, quantity)
{
    <?php
      foreach ($dicounts_unf as $discount) {
        echo 'if ((quantity >= '.$discount['quantity'].') && ('.$discount['price'].' < price)) price = '.$discount['price'].';'."\n";
      }
    ?>
    return price;
}


animate_delay = 20;

main_price_final = calculate_tax(Number($('#formated_price').attr('price')));
main_price_start = calculate_tax(Number($('#formated_price').attr('price')));
main_step = 0;
main_timeout_id = 0;

function animateMainPrice_callback() {
    main_price_start += main_step;
    
    if ((main_step > 0) && (main_price_start > main_price_final)){
        main_price_start = main_price_final;
    } else if ((main_step < 0) && (main_price_start < main_price_final)) {
        main_price_start = main_price_final;
    } else if (main_step == 0) {
        main_price_start = main_price_final;
    }
    
    $('#formated_price').html( price_format(main_price_start) );
    
    if (main_price_start != main_price_final) {
        main_timeout_id = setTimeout(animateMainPrice_callback, animate_delay);
    }
}

function animateMainPrice(price) {
    main_price_start = main_price_final;
    main_price_final = price;
    main_step = (main_price_final - main_price_start) / 10;
    
    clearTimeout(main_timeout_id);
    main_timeout_id = setTimeout(animateMainPrice_callback, animate_delay);
}


<?php if ($special) { ?>
special_price_final = calculate_tax(Number($('#formated_special').attr('price')));
special_price_start = calculate_tax(Number($('#formated_special').attr('price')));
special_step = 0;
special_timeout_id = 0;

function animateSpecialPrice_callback() {
    special_price_start += special_step;
    
    if ((special_step > 0) && (special_price_start > special_price_final)){
        special_price_start = special_price_final;
    } else if ((special_step < 0) && (special_price_start < special_price_final)) {
        special_price_start = special_price_final;
    } else if (special_step == 0) {
        special_price_start = special_price_final;
    }
    
    $('#formated_special').html( price_format(special_price_start) );
    
    if (special_price_start != special_price_final) {
        special_timeout_id = setTimeout(animateSpecialPrice_callback, animate_delay);
    }
}

function animateSpecialPrice(price) {
    special_price_start = special_price_final;
    special_price_final = price;
    special_step = (special_price_final - special_price_start) / 10;
    
    clearTimeout(special_timeout_id);
    special_timeout_id = setTimeout(animateSpecialPrice_callback, animate_delay);
}
<?php } ?>


function recalculateprice()
{
    var main_price = Number($('#formated_price').attr('price'));
    var input_quantity = Number($('#product_buy_quantity').attr('value'));
    var special = Number($('#formated_special').attr('price'));
    var tax = Number($('#formated_tax').attr('price'));
    
    // Process Discounts.
    <?php if ($special) { ?>
        special_coefficient = <?php echo ((float)$price_value/(float)$special_value); ?>;
    <?php } ?>
    main_price = process_discounts(main_price, input_quantity);
    tax = process_discounts(tax, input_quantity);
    
    
   <?php if ($points) { ?>
     var points = Number($('#formated_points').attr('points'));
     $('#product_options input:checked').each(function() {
       points += Number($(this).attr('points'));
     });
     $('#product_options option:selected').each(function() {
       points += Number($(this).attr('points'));
     });
     $('#formated_points').html(points);
   <?php } ?>
    
    
    $('#product_options input:checked,option:selected').each(function() {
      if ($(this).attr('price_prefix') == '=') {
        d_price = Number($(this).attr('price'));
        main_price = d_price;
        <?php if ($special) { ?>
            d_price /= special_coefficient;
        <?php } ?>
        special = d_price;
        tax = d_price;
      }
    });
    
    $('#product_options input:checked,option:selected').each(function() {
      if ($(this).attr('price_prefix') == '+') {
        d_price = Number($(this).attr('price'));
        main_price += d_price;
        <?php if ($special) { ?>
            d_price /= special_coefficient;
        <?php } ?>
        special += d_price;
        tax += d_price;
      }
      if ($(this).attr('price_prefix') == '-') {
        d_price = Number($(this).attr('price'));
        main_price -= d_price;
        <?php if ($special) { ?>
            d_price /= special_coefficient;
        <?php } ?>
        special -= d_price;
        tax -= d_price;
      }
      if ($(this).attr('price_prefix') == '*') {
        main_price = main_price * Number($(this).attr('price'));
        special = special * Number($(this).attr('price'));
        tax = tax * Number($(this).attr('price'));
      }
    });

    // Process TAX.
    main_price = calculate_tax(main_price);
    special = calculate_tax(special);
    
    // Раскомментировать, если нужен вывод цены с умножением на количество
    //main_price *= input_quantity;
    //special *= input_quantity;
    //tax *= input_quantity;
    

    // Display Main Price
    //$('#formated_price').html( price_format(main_price) );
    animateMainPrice(main_price);
      
    <?php if ($special) { ?>
      html = 'Вы экономите: <span class="price">' + price_format(main_price - special) + '</span>';
      $('.price-economy').html(html);
    
      //$('#formated_special').html( price_format(special) );
      animateSpecialPrice(special);
    <?php } ?>

    <?php if ($tax) { ?>
      $('#formated_tax').html( price_format(tax) );
    <?php } ?>
}

recalculateprice();

//--></script>
        
      
<?php echo $footer; ?>