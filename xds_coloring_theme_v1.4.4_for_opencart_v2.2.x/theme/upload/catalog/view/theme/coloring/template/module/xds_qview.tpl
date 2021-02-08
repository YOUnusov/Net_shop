<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	<h4 class="modal-title"><?php echo $heading_title; ?><?php if ($in_cart) { ?> <?php } ?></h4>
</div>

<div class="modal-body">
	<div class="row">
		<div class="col-md-6">
			<div class="images text-center">
				<?php if ($thumb) { ?>
				<div class="thumb">
					<img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" class="img-rounded img-responsive center-block" />
				</div>
				<?php } ?>
				<?php if ($images) { ?>
				<div id="additional-images">
					<?php if ($small_thumb) { ?>
					<img src="<?php echo $small_thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" class="img-responsive img-thumbnail active" />
					<?php } ?>
					<?php foreach ($images as $image) { ?>
					<img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" class="img-responsive img-thumbnail"/>
					<?php } ?>
				</div>
				<?php } ?>
			</div>		
		</div>
		<div class="col-md-6 sm-xs-center">
			<hr class="visible-xs visible-sm">
			<div class="row">
				<div class="col-md-9 middle-45px-parent">
					<div class="middle-45px">
						<div class="model"><?php echo $text_model; ?> <span class="red-link"><?php echo $model; ?></span></div>
						<?php if ($manufacturer) { ?>
						<div class="manufacturer">
							<?php echo $text_manufacturer; ?> <a href="<?php echo $manufacturers; ?>" class="red-link"><?php echo $manufacturer; ?></a>
						</div>
						<?php } ?>
					</div>
				</div>
				<div class="col-md-3 text-right middle-45px-parent">
					<div class="middle-45px">
						<div class="btn-group">
							<button type="button" data-toggle="tooltip" data-placement="top" class="btn btn-default" title="<?php echo $button_wishlist; ?>" onclick="qview_wishlist.add('<?php echo $product_id; ?>');"><i class="fa fa-heart fa-fw"></i></button>
							<button type="button" data-toggle="tooltip" data-placement="top" class="btn btn-default" title="<?php echo $button_compare; ?>" onclick="qview_compare.add('<?php echo $product_id; ?>');"><i class="fa fa-balance-scale fa-fw"></i></button> 
						</div>
					</div>
				</div>
			</div>
			
			
			<?php if ($price) { ?>
			<div class="row">
				<div class="col-sm-12">
					<div class="price">
						<hr>
						<?php if ($special) { ?>
						<div class="price-old">&nbsp;<?php echo $price; ?>&nbsp;</div>
						<div><?php echo $special; ?></div>
						<?php } else { ?>
						<div><?php echo $price; ?></div>
						<?php } ?>
						<?php if ($tax) { ?>
						<div class="tax"><?php echo $text_tax; ?> <?php echo $tax; ?></div>
						<?php } ?>
					</div>
				</div>
			</div>
			<?php } ?>

			<?php if ($discounts) { ?>
			<div class="row">
				<div class="col-sm-12">
					<hr>
					<div class="discounts">
						<?php foreach ($discounts as $discount) { ?>
						<div><?php echo $discount['quantity']; ?><?php echo $text_discount; ?><?php echo $discount['price']; ?></div>
						<?php } ?>
					</div>
				</div>
			</div>
			<?php } ?>

			<?php if ($points) { ?>
			<div class="row">
				<div class="col-sm-12">
					<hr>
					<div class="points"><?php echo $text_points; ?> <strong><?php echo $points; ?></strong></div>
				</div>
			</div>
			<?php } ?>

			<?php if ($review_status) { ?>
			<div class="row">
				<div class="col-sm-12">
					<div class="review">
						<hr>
						<span class="stars">
							<?php for ($i = 1; $i <= 5; $i++) { ?>
							<?php if ($rating < $i) { ?>
							<i class="fa fa-star"></i>
							<?php } else { ?>
							<i class="fa fa-star active"></i>
							<?php } ?>
							<?php } ?>
						</span>&nbsp;
						<a href="<?php echo $review_href; ?>"><?php echo $tab_review; ?></a>
					</div>
				</div>
			</div>
			<?php } ?>
			
			<div class="row sm-xs-center">
				<div class="col-sm-12">
					<div class="description">
						<hr>
						<?php echo utf8_substr(strip_tags(html_entity_decode($description, ENT_QUOTES, 'UTF-8')), 0, 200) . '... ' ?><a href="<?php echo $product_href; ?>" class="red-link" >&#8594;</a>
					</div>
				</div>
			</div>
			
			<?php if ($options) { ?>
			<div class="row">
				<div class="col-lg-12">
					<div class="options">
            <?php foreach ($options as $option) { ?>
            <?php if ($option['type'] == 'select') { ?>
						<hr>
						<div class="form-inline">
							<div class="form-group">
								<label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>">
									<?php echo $option['name']; ?>
									<?php if ($option['required']) { ?>
										<sup><i class="fa fa-exclamation-circle required" data-toggle="tooltip" data-placement="left" title="<?php echo $product_required_text; ?>"></i></sup>&nbsp;
									<?php } ?>
								</label>:&nbsp;
								<select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="input-sm form-control">
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
						</div>
            <?php } ?>

            <?php if ($option['type'] == 'radio') { ?>
						<hr>
						<div class="form-inline">
							
								<label class="control-label">
									<?php echo $option['name']; ?>
									<?php if ($option['required']) { ?>
										<sup><i class="fa fa-exclamation-circle required" data-toggle="tooltip" data-placement="left" title="<?php echo $product_required_text; ?>"></i></sup>&nbsp;
									<?php } ?>
								</label>:&nbsp;
								<div class="form-group" id="input-option<?php echo $option['product_option_id']; ?>" data-toggle="buttons">
								<?php foreach ($option['product_option_value'] as $option_value) { ?>
								
								<label class="btn btn-default btn-xs cr">
									<input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>"  />
									<span class="option-name"><?php echo $option_value['name']; ?></span>
									<?php if ($option_value['price']) { ?>
									<span class="option-price"><?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?></span>
									<?php } ?>
								</label>
								
								<?php } ?>
								</div>
							
						</div>
            <?php } ?>

            <?php if ($option['type'] == 'checkbox') { ?>
						<hr>
						<div class="form-inline">
							
								<label class="control-label">
									<?php echo $option['name']; ?>
									<?php if ($option['required']) { ?>
										<sup><i class="fa fa-exclamation-circle required" data-toggle="tooltip" data-placement="left" title="<?php echo $product_required_text; ?>"></i></sup>&nbsp;
									<?php } ?>
									
								</label>:&nbsp;
								<div class="form-group" id="input-option<?php echo $option['product_option_id']; ?>" data-toggle="buttons">
								<?php foreach ($option['product_option_value'] as $option_value) { ?> 
								<label class="btn btn-default btn-xs cr">
									<input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" />
									<span class="option-name"><?php echo $option_value['name']; ?></span>
									<?php if ($option_value['price']) { ?>
									<span class="option-price"><?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?></span>
									<?php } ?>
								</label>
								<?php } ?>
								
							</div>
						</div>
            <?php } ?>

            <?php if ($option['type'] == 'image') { ?>
						<hr>
						<div class="form-inline">
							
								<label class="control-label">
									<?php echo $option['name']; ?>
									<?php if ($option['required']) { ?>
										<sup><i class="fa fa-exclamation-circle required" data-toggle="tooltip" data-placement="left" title="<?php echo $product_required_text; ?>"></i></sup>&nbsp;
									<?php } ?>
								</label>:&nbsp;
								<div class="form-group" id="input-option<?php echo $option['product_option_id']; ?>">
								<?php foreach ($option['product_option_value'] as $option_value) { ?>
								<label class="image-radio">
									<input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
									<img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" data-toggle="tooltip" title="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" /> 
								</label>
								<?php } ?>
							</div>
						</div>
            <?php } ?>

            <?php if ($option['type'] == 'text') { ?>
						<hr>
						<div class="form-inline">
							<div class="form-group">
								<label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>">
									<?php echo $option['name']; ?>
									<?php if ($option['required']) { ?>
										<sup><i class="fa fa-exclamation-circle required" data-toggle="tooltip" data-placement="left" title="<?php echo $product_required_text; ?>"></i></sup>&nbsp;
									<?php } ?>
									
								</label>:&nbsp;
								<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="input-sm form-control" />
							</div>
						</div>
            <?php } ?>

            <?php if ($option['type'] == 'textarea') { ?>
						<hr>
						<div class="form-inline">
							<div class="form-group">
								<label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>">
									<?php echo $option['name']; ?>
									<?php if ($option['required']) { ?>
										<sup><i class="fa fa-exclamation-circle required" data-toggle="tooltip" data-placement="left" title="<?php echo $product_required_text; ?>"></i></sup>&nbsp;
									<?php } ?>
								</label>:&nbsp;
								<textarea name="option[<?php echo $option['product_option_id']; ?>]" rows="1" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="input-sm form-control"><?php echo $option['value']; ?></textarea>
							</div>
						</div>
            <?php } ?>

            <?php if ($option['type'] == 'file') { ?>
						<hr>
						<div class="form-inline">
							
								<label class="control-label">
									<?php echo $option['name']; ?>
									<?php if ($option['required']) { ?>
										<sup><i class="fa fa-info-circle required" data-toggle="tooltip" data-placement="left" title="<?php echo $product_required_text; ?>"></i></sup>
									<?php } ?>
								</label>:&nbsp;
								<div class="form-group">
								<button type="button" id="button-upload<?php echo $option['product_option_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default btn-sm btn-block"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
								<input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" id="input-option<?php echo $option['product_option_id']; ?>" />
							</div>
						</div>
            <?php } ?>

            <?php if ($option['type'] == 'date') { ?>
						<hr>
						<div class="form-inline">
							<div class="form-group">
								<label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>">
									<?php echo $option['name']; ?>
									<?php if ($option['required']) { ?>
										<sup><i class="fa fa-exclamation-circle required" data-toggle="tooltip" data-placement="left" title="<?php echo $product_required_text; ?>"></i></sup>&nbsp;
									<?php } ?>
									
								</label>:&nbsp;
								<div class="input-group date">
									<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD" id="input-option<?php echo $option['product_option_id']; ?>" class="input-sm form-control" />
									<span class="input-group-btn">
									<button class="btn btn-default btn-sm" type="button"><i class="fa fa-calendar"></i></button>
									</span>
								</div>
							</div>
						</div>
            <?php } ?>

            <?php if ($option['type'] == 'datetime') { ?>
						<hr>
						<div class="form-inline">
							<div class="form-group">
								<label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>">
									<?php echo $option['name']; ?>
									<?php if ($option['required']) { ?>
										<sup><i class="fa fa-exclamation-circle required" data-toggle="tooltip" data-placement="left" title="<?php echo $product_required_text; ?>"></i></sup>&nbsp;
									<?php } ?>
									
								</label>:&nbsp;
								<div class="input-group datetime">
									<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="input-sm form-control" />
									<span class="input-group-btn">
									<button type="button" class="btn btn-default btn-sm"><i class="fa fa-calendar"></i></button>
									</span>
								</div>
							</div>
						</div>
            <?php } ?>

            <?php if ($option['type'] == 'time') { ?>
						<hr>
						<div class="form-inline">
							<div class="form-group">
								<label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>">
									<?php echo $option['name']; ?>
									<?php if ($option['required']) { ?>
										<sup><i class="fa fa-exclamation-circle required" data-toggle="tooltip" data-placement="left" title="<?php echo $product_required_text; ?>"></i></sup>&nbsp;
									<?php } ?>
								</label>:&nbsp;
								<div class="input-group time">
									<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="input-sm form-control" />
									<span class="input-group-btn">
									<button type="button" class="btn btn-default btn-sm"><i class="fa fa-calendar"></i></button>
									</span>
								</div>
							</div>
						</div>
            <?php } ?>
            <?php } ?>
          </div>
				</div>
			</div>
			<?php } ?>
			
			<?php if ($recurrings) { ?>
			<div class="row">
				<div class="col-lg-12">
					<hr>
					<div class="form-inline">
						<label class="control-label">
							<?php echo $text_payment_recurring ?>
							<sup><i class="fa fa-exclamation-circle required" data-toggle="tooltip" data-placement="left" title="<?php echo $product_required_text; ?>"></i></sup>&nbsp;
						</label>:&nbsp;
						<div class="form-group">
							<select name="recurring_id" class="form-control input-sm">
								<option value=""><?php echo $text_select; ?></option>
								<?php foreach ($recurrings as $recurring) { ?>
								<option value="<?php echo $recurring['recurring_id'] ?>"><?php echo $recurring['name'] ?></option>
								<?php } ?>
							</select>
						</div>
					</div>
					<div class="help-block" id="recurring-description"></div>
				</div>			
			</div>		
      <?php } ?>
			
		</div>
	</div>
</div>

<div class="modal-footer">
	<div class="row">
		<div class="col-md-3 col-sm-6">
			<button type="button" class="btn btn-default btn-block" data-dismiss="modal"><?php echo $back_button_text; ?></button>
		</div>
		<div class="col-md-3 col-sm-6">
			<div style="margin-top: 15px;" class="visible-xs"></div>
			<button onclick="location.href=<?php echo '\'' . $product_href . '\''; ?>" type="button" class="btn btn-default btn-block"><?php echo $more_button_text; ?></button>
		</div>
		<div class="col-md-6 col-sm-12">
		<div style="margin-top: 15px;" class="visible-sm visible-xs"></div>
			<div class="row">
				<div class="col-md-5 col-sm-6">
				
					<div class="input-group" >
						<span class="input-group-btn">
							<button class="btn btn-default" id="minus"><i class="fa fa-minus fa-fw"></i></button>
						</span>
						
						<input type="text" name="quantity" value="<?php echo $minimum; ?>" id="modal-input-quantity" class="form-control" style="text-align: center; font-weight: bold;" />
						<span class="input-group-btn">
							<button class="btn btn-default" id="plus"><i class="fa fa-plus fa-fw"></i></button>
						</span>
					</div>
					<input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
				</div>
				<div class="col-md-7 col-sm-6">
					<div style="margin-top: 15px;" class="visible-xs"></div>
					
					<?php if (($product_quantity <= 0) and $disable_cart_button){ ?>
					<button type="button" class="btn btn-danger btn-block" disabled><b><?php echo $disable_cart_button_text; ?></b></button>
					<?php } else { ?>
					<button type="button" class="btn btn-danger btn-block" id="modal-button-cart" data-loading-text="<?php echo $text_loading; ?>"><b><?php echo $button_cart; ?></b></button>
					<?php } ?>
					
				</div>
			</div>
		</div>
	</div>
</div>

<script>
$("#additional-images").owlCarousel({
	responsiveBaseWidth: '#additional-images',
	itemsCustom: [[0, 3],[300, 4]],
	theme: 'qview-images',
	navigation: true,
	slideSpeed: 200,
	paginationSpeed: 300,
	stopOnHover: true,
	touchDrag: true,
	mouseDrag: false,
	navigationText: ['<i class="fa fa-chevron-left"></i>', '<i class="fa fa-chevron-right"></i>'],
	pagination: false,
	autoPlay: false
});
	
	$('#additional-images img').click(function(){
		var activeElement = $(this);
			oldSrc = activeElement.attr('src'),
			newSrc = oldSrc.replace('55x55','350x350');
		$.when( $('#additional-images img').removeClass('active') ).then(function () {
			$('.thumb img').attr('src', newSrc);
			activeElement.addClass('active');
		});
	});
	
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
		
		timer = setInterval(function() {
			if ($('#form-upload input[name=\'file\']').val() != '') {
				clearInterval(timer);
				
				$.ajax({
					url: 'index.php?route=tool/upload',
					type: 'post',
					dataType: 'json',
					data: new FormData($('#form-upload')[0]),
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
			}
		}, 500);
	});
	
$('#modal-button-cart').on('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: $('#modal-qview input[type=\'text\'], #modal-qview input[type=\'hidden\'], #modal-qview input[type=\'radio\']:checked, #modal-qview input[type=\'checkbox\']:checked, #modal-qview select, #modal-qview textarea'),
		dataType: 'json',
		beforeSend: function() {
			$('#modal-button-cart').button('loading');
		},
		complete: function() {
			$('#modal-button-cart').button('reset');
		},
		success: function(json) {
			$('.text-danger').remove();
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

				$('#modal-qview').modal('hide');
				
				$('#modal-qview').on('hidden.bs.modal', function (e) {
					$('#modal-cart').modal('show');
				});
	


					setTimeout(function () {
						$('#cart-total').html(json['total_new']);
					}, 100);

					$.ajax({
						url: 'index.php?route=common/cart/info',
						type: 'get',
						dataType: 'html',
						beforeSend: function() {
							$('.cartMask').css({'display':'block'});
						},
						success: function(data){
							$('#modal-cart .modal-body').html($(data).find('.modal-body').html());
							$('#modal-cart .modal-body').prepend('<div class="alert alert-success"><button type="button" class="close" data-dismiss="alert">&times;</button><i class="fa fa-info-circle"></i>&nbsp;&nbsp;' + json['success'] + '</div>');
						}
					});
			} 
			
			
			
		}, error: function(xhr, ajaxOptions, thrownError) {
      alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
    }
	});
});
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
			$('.text-danger').remove();
			
			if (json['success']) {
				$('#recurring-description').html(json['success']);
			}
		}
	});
});


$('#minus').click(function () {
  var $input = $(this).parent().parent().find('input');
  var count = parseInt($input.val()) - 1;
  count = count < <?php echo $minimum; ?> ? <?php echo $minimum; ?> : count;
  $input.val(count);
  $input.change();
  return false;
});
$('#plus').click(function () {
  var $input = $(this).parent().parent().find('input');
  $input.val(parseInt($input.val()) + 1);
  $input.change();
  return false;
});



var qview_wishlist = {
	'add': function(product_id) {
		$('#modal-qview .alert').remove();
		$.ajax({
			url: 'index.php?route=account/wishlist/add',
			type: 'post',
			data: 'product_id=' + product_id,
			dataType: 'json',
			success: function(json) {

				if (json['success']) {
				html = '<div class="alert alert-success"><i class="fa fa-check"></i>&nbsp;&nbsp;' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>';}
				
				if (json['redirect']) {
				html = '<div class="alert alert-info"><i class="fa fa-info-circle"></i> ' + json['info'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>';}
				


				$('#modal-qview .modal-body').prepend(html);

			
				$('#wishlist-total').html(json['total']);
			},
	        error: function(xhr, ajaxOptions, thrownError) {
	            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
	        }
		});
	},
	'remove': function() {

	}
}

var qview_compare = {
	'add': function(product_id) {
		$('#modal-qview .alert').remove();
		$.ajax({
			url: 'index.php?route=product/compare/add',
			type: 'post',
			data: 'product_id=' + product_id,
			dataType: 'json',
			success: function(json) {				

				html = '<div class="alert alert-success"><i class="fa fa-check"></i>&nbsp;&nbsp;' + json['success'] + '<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button></div>';

				
				$('#modal-qview .modal-body').prepend(html);

				

				$('#compare-total').html(json['total']);
			},
	        error: function(xhr, ajaxOptions, thrownError) {
	            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
	        }
		});
	},
	'remove': function() {

	}
}
</script>






