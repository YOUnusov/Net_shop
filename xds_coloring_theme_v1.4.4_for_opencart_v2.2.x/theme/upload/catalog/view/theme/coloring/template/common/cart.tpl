<div id="cart" class="btn-group btn-block">
  <button type="button"  data-toggle="modal" data-target="#modal-cart" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary btn-block dropdown-toggle">
		<i class="fa fa-angle-down"></i>
		<span id="cart-total"><?php echo $text_items_new; ?></span>
	</button>
	<div id="modal-cart" class="modal fade">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	        <h4 class="modal-title">
	          <span class="fa fa-shopping-basket fa-fw"></span>&nbsp;&nbsp;<?php echo $text_popup_cart; ?>
	        </h4>
	      </div>
	      <div class="modal-body">
					<?php if ($products || $vouchers) { ?>
	        <div class="well well-sm products">		
						<?php foreach ($products as $product) { ?>
						<div class="product">
							<div class="row">
								<div class="col-sm-6">
									<div class="image">
										<?php if ($product['thumb']) { ?>
										<a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-thumbnail" /></a>
										<?php } ?>
									</div>
									<div class="name cartCell">
										<div class="cartCellContent">
											<a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
											<?php if ($product['option']) { ?>
											<br><button class="btn btn-xs" data-toggle="dropdown" ><?php echo $text_popup_options; ?></button>
											<ul class="dropdown-menu" style="padding: 10px">
												<?php foreach ($product['option'] as $option) { ?>
												<li><?php echo $option['name']; ?>: <?php echo $option['value']; ?></li>
												<?php } ?>
											</ul>
											<?php } ?>
											<?php if ($product['recurring']) { ?>
											<small><?php echo $text_recurring; ?> <?php echo $product['recurring']; ?></small>
										<?php } ?>
										</div>
									</div>
								</div>
								<div class="col-sm-6">
									<div class="row">
										<div class="col-xs-5 cartCell">
											<div class="cartCellContent pquantity">
												<div class="input-group popup-quantity">
													<span class="input-group-btn">
														<button class="btn btn-sm btn-default" type="button" onclick="cart.updatePopup('<?php echo $product['cart_id']; ?>','<?php echo $product['quantity']-1; ?>');" >-</button>
													</span>
													<input type="text" class="form-control input-sm" value="<?php echo $product['quantity']; ?>" onchange="cart.updatePopup('<?php echo $product['cart_id']; ?>', $(this).val());">
													<span class="input-group-btn">
														<button class="btn btn-sm btn-default" type="button" onclick="cart.updatePopup('<?php echo $product['cart_id']; ?>','<?php echo $product['quantity']+1; ?>');">+</button>
													</span>
												</div>
											</div>
										</div>
										<div class="col-xs-5 cartCell pprice">
											<div class="cartCellContent">
												<?php echo $product['total']; ?>
											</div>
										</div>
										<div class="col-xs-2 cartCell text-center">
											<div class="cartCellContent">
												<a href="#" onclick="cart.remove('<?php echo $product['cart_id']; ?>');return false;" title="<?php echo $button_remove; ?>" class=""><i class="fa fa-trash-o fa-lg"></i></a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<?php } ?>

							
						<?php foreach ($vouchers as $voucher) { ?>
						<div class="row">
							<td class="text-left" colspan="3"><?php echo $voucher['description']; ?></td>
							<td class="text-right"><?php echo $voucher['amount']; ?></td>
							<td class="text-center text-danger"><button type="button" onclick="voucher.remove('<?php echo $voucher['key']; ?>');" title="<?php echo $button_remove; ?>" class="btn btn-danger btn-xs"><i class="fa fa-times"></i></button></td>
						</div>
						<?php } ?>

						<div class="cartMask"><div><div><i class="fa fa-circle-o-notch fa-spin fa-2x fa-fw"></i></div></div></div>
					</div>
	        <div class="totals text-center">
						<a class="popupTotal collapsed" data-toggle="collapse" href="#total-more" title="Подробнее"><?php echo $text_items_popup; ?>&nbsp;&nbsp;<i class="fa fa-angle-down"></i></a>
						<div id="total-more" class="collapse">
							<table class="table table-condensed">
								<?php foreach ($totals as $total) { ?>
								<tr>
									<td class="text-right" style="width: 50%"><strong><?php echo $total['title']; ?></strong></td>
									<td class="text-left" style="width: 50%"><?php echo $total['text']; ?></td>
								</tr>
								<?php } ?>
							</table>
						</div>
					</div>
					<?php } else { ?>
					<div class="text-center" style="padding: 30px 0"><?php echo $text_empty; ?></div>
					<div class="cartMask white"><div><div><i class="fa fa-circle-o-notch fa-spin fa-2x fa-fw"></i></div></div></div>
					<?php } ?>
					
	      </div>
	      <div class="modal-footer">
	        <div class="row">
	          <div class="col-sm-4 btn-col-1">
	            <a class="btn btn-default btn-block" data-dismiss="modal"><?php echo $text_popup_continue; ?></a>
	          </div>
	          <div class="col-sm-4 btn-col-2">
							<a href="<?php echo $cart; ?>" class="btn btn-default btn-block"><?php echo $text_cart; ?></a>
						</div>
	          <div class="col-sm-4 btn-col-3">
							<a href="<?php echo $checkout; ?>" class="btn btn-block btn-danger"><?php echo $text_checkout; ?></a>
						</div>
	        </div>
	      </div>
	    </div>
	  </div>
	</div>

</div>
<script>
	$(document).ready(function () {
		$('body').append($('#modal-cart'));
	});
	$('#modal-cart').on('hidden.bs.modal', function (e) {
		$(this).find('.alert').remove();
	})
</script>