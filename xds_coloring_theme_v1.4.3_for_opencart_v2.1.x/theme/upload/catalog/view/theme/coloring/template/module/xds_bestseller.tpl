<?php if ($shuffle) {shuffle($products);}; ?>
<div class="panel panel-default box-product">
	<div class="panel-heading"><?php echo $heading_title; ?></div>
	<div id="xds-bestseller<?php echo $module; ?>" class="panel-body">
		<?php foreach ($products as $product) { ?>
		<?php if (!(($product['quantity'] <= 0) && $exclude)) { ?>
		<div class="product-item">
			<div class="image">
				<a href="<?php echo $product['href']; ?>">
					<img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" />
				</a>
				<?php if ($product['discount']) { ?>
				<div class="sticker st-sale <?php if ($product['date_end']) { echo 'with-date'; }?>" ><?php echo $product['discount']; ?>&#37;
				</div>
				<?php } ?>
			</div>
			<div class="caption">
				<div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
				<?php if ($product['price']) { ?>
				<div class="price">
					<?php if (!$product['special']) { ?>
					<?php echo $product['price']; ?>
					<?php } else { ?>
					<span class="price-old">&nbsp;<?php echo $product['price']; ?>&nbsp;</span> <span class="price-new"><?php echo $product['special']; ?></span>
					<?php } ?>
					<?php if ($product['tax']) { ?>
					<br /><span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
					<?php } ?>
				</div>
				<?php } ?>
			</div>
			<div class="buttons">
				<div class="btn-group dropup">
					<?php if (($product['quantity'] <= 0) and $disable_cart_button){ ?>
					<button type="button" class="btn btn-addtocart" title="<?php echo $button_cart; ?>" disabled><?php echo $disable_cart_button_text; ?> </button>
					<?php } else { ?>
					<button type="button" class="btn btn-addtocart" onclick="cart.add('<?php echo $product['product_id']; ?>');" title="<?php echo $button_cart; ?>"><i class="fa fa-shopping-basket fa-fw"></i>&nbsp;&nbsp;<?php echo $button_cart; ?> </button>
					<?php } ?>
					<?php if ($on_off_qview){ ?>
					<button class="btn btn-addtocart btn-qview" data-qview="<?php echo $product['qview']; ?>" data-toggle="tooltip" title="<?php echo $qview_text; ?>">
						<i class="fa fa-eye fa-fw"></i>
					</button>
					<?php } ?>
					<button type="button" class="btn btn-addtocart dropdown-toggle" data-toggle="dropdown">
						<i class="fa fa-angle-down caretalt"></i>
					</button>
					<ul class="dropdown-menu addtocart-additional">
						<li><a href="#" onclick="wishlist.add('<?php echo $product['product_id']; ?>');return false;" title="<?php echo $button_wishlist; ?>"><i class="fa fa-heart fa-fw"></i>&nbsp;&nbsp;<?php echo $button_wishlist; ?></a></li>
						<li><a href="#" onclick="compare.add('<?php echo $product['product_id']; ?>');return false;" title="<?php echo $button_compare; ?>"><i class="fa fa-balance-scale fa-fw"></i>&nbsp;&nbsp;<?php echo $button_compare; ?></a></li>
					</ul>
				</div>
			</div>
		</div>
		<?php } ?>
		<?php } ?>
	</div>
	<script type="text/javascript">
		$('#xds-bestseller<?php echo $module; ?>').owlCarousel({
			responsiveBaseWidth: '#xds-bestseller<?php echo $module; ?>',
			itemsCustom: [[0, 1], [448, 2], [668, 3], [848, 4], [1000, 5]],
			theme: 'product-carousel',
			navigation: true,
			slideSpeed: 200,
			paginationSpeed: 300,
			stopOnHover: true,
			touchDrag: true,
			mouseDrag: false,
			navigationText: ['<i class="fa fa-chevron-left"></i>', '<i class="fa fa-chevron-right"></i>'],
			pagination: false,
			<?php if ($autoplay) { ?>
			<?php if ($autoplay_speed) { ?>
			autoPlay: <?php echo $autoplay_speed; ?>
			<?php } else { ?>
			autoPlay: true
			<?php } ?>
			<?php } else {?>
			autoPlay: false
			<?php } ?>
		});
		<?php foreach ($products as $product) { ?>
		<?php if ($product['date_end']) {  ?>
		$('#xds-bestseller-clock-m<?php echo $module; ?>-p<?php echo $product['product_id']; ?>').countdown('<?php echo $product['date_end']; ?>', function(event) {
			$(this).html(event.strftime('%D<?php echo $text_days; ?> %H:%M:%S'));
		});
		<?php } ?>
		<?php } ?>
	</script>
</div>