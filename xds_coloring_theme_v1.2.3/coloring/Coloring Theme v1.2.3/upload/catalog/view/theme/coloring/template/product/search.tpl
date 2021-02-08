<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-4 col-md-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-8 col-md-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h1><?php echo $heading_title; ?></h1>
			<div class="well well-sm">
      <label class="control-label" for="input-search"><?php echo $entry_search; ?></label>
      <div class="row">
        <div class="col-sm-4">
          <input type="text" name="search" value="<?php echo $search; ?>" placeholder="<?php echo $text_keyword; ?>" id="input-search" class="form-control" />
        </div>
        <div class="col-sm-3">
          <select name="category_id" class="form-control">
            <option value="0"><?php echo $text_category; ?></option>
            <?php foreach ($categories as $category_1) { ?>
            <?php if ($category_1['category_id'] == $category_id) { ?>
            <option value="<?php echo $category_1['category_id']; ?>" selected="selected"><?php echo $category_1['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $category_1['category_id']; ?>"><?php echo $category_1['name']; ?></option>
            <?php } ?>
            <?php foreach ($category_1['children'] as $category_2) { ?>
            <?php if ($category_2['category_id'] == $category_id) { ?>
            <option value="<?php echo $category_2['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $category_2['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
            <?php } ?>
            <?php foreach ($category_2['children'] as $category_3) { ?>
            <?php if ($category_3['category_id'] == $category_id) { ?>
            <option value="<?php echo $category_3['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $category_3['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
            <?php } ?>
            <?php } ?>
            <?php } ?>
            <?php } ?>
          </select>
        </div>
        <div class="col-sm-3">
          <label class="checkbox-inline">
            <?php if ($sub_category) { ?>
            <input type="checkbox" name="sub_category" value="1" checked="checked" />
            <?php } else { ?>
            <input type="checkbox" name="sub_category" value="1" />
            <?php } ?>
            <?php echo $text_sub_category; ?></label>
        </div>
      </div>
      <p>
        <label class="checkbox-inline">
          <?php if ($description) { ?>
          <input type="checkbox" name="description" value="1" id="description" checked="checked" />
          <?php } else { ?>
          <input type="checkbox" name="description" value="1" id="description" />
          <?php } ?>
          <?php echo $entry_description; ?></label>
      </p>
      <input type="button" value="<?php echo $button_search; ?>" id="button-search" class="btn btn-primary" />
      
			</div>
			
			<h2><?php echo $text_search; ?></h2>
      <?php if ($products) { ?>
<div class="well well-sm">
				<div class="row">
					<div class="col-sm-3 col-lg-4">
						<div class="btn-group">
							<button type="button" id="list-view" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_list; ?>">
								<i class="fa fa-th-list"></i><span class="hidden-sm hidden-md">&nbsp;&nbsp;<?php echo $button_list; ?></span>
							</button>
							<button type="button" id="grid-view" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_grid; ?>">
								<i class="fa fa-th-large"></i><span class="hidden-sm hidden-md">&nbsp;&nbsp;<?php echo $button_grid; ?></span>
							</button>
						</div>
						<hr class="hr-margin-5 visible-xs">
					</div>						
					<div class="col-sm-6 col-lg-5 text-center-sm">
						<span class="hidden-xs hidden-sm"><?php echo $text_sort; ?>&nbsp;</span>
						<div class="btn-group sort-btn-groupe">
							<ul class="dropdown-menu">
								<?php foreach ($sorts as $sorts) { ?>
								<?php if ($sorts['value'] == $sort . '-' . $order) { ?>
								<?php $button_text_sort = $sorts['text']; ?>
								<?php } else { ?>
								<li><a href="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></a></li>
								<?php } ?>
								<?php } ?>
							</ul>
							<a href="#" class="btn btn-default sorts-btn dropdown-toggle" data-toggle="dropdown">
								<i class="fa fa-sort"></i>&nbsp;&nbsp;<?php echo $button_text_sort; ?>&nbsp;&nbsp;<span class="caret"></span>
							</a>
						</div>
						<script>
							$(function(){
								$('.sort-btn-groupe').prepend($('.sorts-btn'));
							});
						</script>
						<hr class="hr-margin-5 visible-xs">
					</div>	
					<div class="col-sm-3 text-right-sm">
						<span class="hidden-xs hidden-sm"><?php echo $text_limit; ?>&nbsp;</span>
						<div class="btn-group limit-btn-groupe">
							<ul class="dropdown-menu pull-right pull-left-xs">
								<?php foreach ($limits as $limits) { ?>
								<?php if ($limits['value'] == $limit) { ?>
								<?php $button_text_limit = $limits['text']; ?>
								<?php } else { ?>
								<li><a href="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></a></li>
								<?php } ?>
								<?php } ?>
							</ul>
							<a href="" class="btn btn-default limit-btn dropdown-toggle" data-toggle="dropdown">
								<i class="fa fa-eye"></i>&nbsp;&nbsp;<?php echo $button_text_limit; ?>&nbsp;&nbsp;<span class="caret"></span>
							</a>
							<script>
								$(function(){
									$('.limit-btn-groupe').prepend($('.limit-btn'));
								});
							</script>
						</div>
					</div>
				</div>	
			</div>

      <div class="row">
        <?php foreach ($products as $product) { ?>
        <div class="product-layout product-list col-xs-12">
          <div class="product-thumb thumbnail ">
            <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive center-block" /></a></div>
            <div>
              <div class="caption">
                <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
                <p class="description"><?php echo $product['description']; ?></p>
                
               
                
                <?php if ($product['price']) { ?>
                <p class="price">
                  <?php if (!$product['special']) { ?>
                  <?php echo $product['price']; ?>
                  <?php } else { ?>
                  <span class="price-old">&nbsp;<?php echo $product['price']; ?>&nbsp;</span> <span class="price-new"><?php echo $product['special']; ?></span>
                  <?php } ?>
                  <?php if ($product['tax']) { ?>
									<br />
                  <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                  <?php } ?>
                </p>
                <?php } ?>
								<?php if ($product['rating']) { ?>
								<p class="rating">
                  <?php for ($i = 1; $i <= 5; $i++) { ?>
                  <?php if ($product['rating'] < $i) { ?>
                  <i class="fa fa-star"></i>
                  <?php } else { ?>
                  <i class="fa fa-star active"></i>
                  <?php } ?>
                  <?php } ?>
									&nbsp;&nbsp;<a href="<?php echo $product['href']; ?>"><?php echo $product['reviews']; ?> отзывов</a>
								</p>
								<?php } else { ?>
								<p class="rating">
									<i class="fa fa-star-o"></i>
                  <i class="fa fa-star-o"></i>
									<i class="fa fa-star-o"></i>
									<i class="fa fa-star-o"></i>
									<i class="fa fa-star-o"></i>
									&nbsp;&nbsp;<?php echo $product['reviews']; ?> отзывов</a>
								</p>
								<?php } ?>
								<div class="btn-group">
									<button class="btn btn-addtocart" type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>
									<button class="btn btn-addtocart" type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
									<button class="btn btn-addtocart" type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
								</div>
              </div>
            </div>
						<div class="clearfix"></div>
          </div>
        </div>
        <?php } ?>
      </div>
      <div class="row">
        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
        <div class="col-sm-6 text-right"><?php echo $results; ?></div>
      </div>
      <?php } else { ?>
      <p><?php echo $text_empty; ?></p>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<script type="text/javascript"><!--
$('#button-search').bind('click', function() {
	url = 'index.php?route=product/search';
	
	var search = $('#content input[name=\'search\']').prop('value');
	
	if (search) {
		url += '&search=' + encodeURIComponent(search);
	}

	var category_id = $('#content select[name=\'category_id\']').prop('value');
	
	if (category_id > 0) {
		url += '&category_id=' + encodeURIComponent(category_id);
	}
	
	var sub_category = $('#content input[name=\'sub_category\']:checked').prop('value');
	
	if (sub_category) {
		url += '&sub_category=true';
	}
		
	var filter_description = $('#content input[name=\'description\']:checked').prop('value');
	
	if (filter_description) {
		url += '&description=true';
	}

	location = url;
});

$('#content input[name=\'search\']').bind('keydown', function(e) {
	if (e.keyCode == 13) {
		$('#button-search').trigger('click');
	}
});

$('select[name=\'category_id\']').on('change', function() {
	if (this.value == '0') {
		$('input[name=\'sub_category\']').prop('disabled', true);
	} else {
		$('input[name=\'sub_category\']').prop('disabled', false);
	}
});

$('select[name=\'category_id\']').trigger('change');
--></script> 
<?php echo $footer; ?> 