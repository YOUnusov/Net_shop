<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<?php if ($icon) { ?>
<link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
<link href="catalog/view/theme/coloring/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
<script src="catalog/view/theme/coloring/assets/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<link href="catalog/view/theme/coloring/assets/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,700,300,600,400&subset=cyrillic-ext,latin-ext' rel='stylesheet' type='text/css'>
<link href="catalog/view/theme/coloring/stylesheet/stylesheet.css" rel="stylesheet">
<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script src="catalog/view/theme/coloring/assets/jquery.dotdotdot.min.js" type="text/javascript"></script>
<script src="catalog/view/theme/coloring/assets/common.js" type="text/javascript"></script>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<?php echo $google_analytics; ?>
<!-- <style type="text/css">#preloader{position:fixed; height:100%; width:100%; top:0; left:0; z-index:9999; background:radial-gradient(circle at center, rgba(255,255,255,1) 20%,rgba(255,255,255,0.9) 100%);} #preloader:before{content:""; position:absolute; height:100%; width:100%; left:0; top:0; background:url(catalog/view/theme/coloring/image/spinner.gif) center no-repeat;}</style> 
<script type="text/javascript">$(window).load(function(){$('#preloader').remove();});</script> -->
</head>
<body class="<?php echo $class; ?>">
<!-- <div id="preloader"></div> -->
<header>
	<div id="top">
		<div class="container text-center text-right-md" >
			<div class="pull-left">
				<div class="inline-block">
					<?php echo $language; ?>
				</div>
				<div class="inline-block">
					<?php echo $currency; ?>
				</div>
			</div>
			<div class="pull-right">
				<div class="btn-group">
					<button type="button" class="btn dropdown-toggle" data-toggle="dropdown">
						<i class="fa fa-support"></i><span class="hidden-sm hidden-xs">&nbsp;&nbsp;<?php echo $header_help_support; ?></span>&nbsp;<span class="caret"></span>
					</button>	
					<ul class="dropdown-menu pull-right">
						<?php if (isset($help_menu) & !empty($help_menu)) {?>
						<?php if ($help_menu['status'] == 1) {?>
						<?php if (isset($help_menu['cust_menu_item'])) { ?>
						<?php foreach ($help_menu['cust_menu_item'] as $item) { ?>
						<li><a href="<?php echo $item['link'][$language_id]; ?>"><?php echo html_entity_decode($item['title'][$language_id], ENT_QUOTES, 'UTF-8'); ?></a></li>
						<?php } ?>
						<?php } ?>
						<?php }?>
						<?php }?>
					</ul>
				</div>
				<div class="btn-group">
					<button type="button" class="btn dropdown-toggle" data-toggle="dropdown">
						<i class="glyphicon glyphicon-user"></i><span class="hidden-sm hidden-xs">&nbsp;&nbsp;<?php echo $text_account; ?></span>&nbsp;<span class="caret"></span>
					</button>	
					<ul class="dropdown-menu pull-right">
						<?php if ($logged) { ?>
						<li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
						<li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
						<li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
						<li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
						<li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
						<?php } else { ?>
						<li><a href="<?php echo $register; ?>"><i class="fa fa-edit"></i> <?php echo $text_register; ?></a></li>
						<li><a href="<?php echo $login; ?>"><i class="fa fa-unlock-alt"></i> <?php echo $text_login; ?></a></li>
						<?php } ?>
					</ul>
				</div>
			</div>
			<div class="btn-group">
				<a class="btn" href="<?php echo $wishlist; ?>" id="wishlist-total"><?php echo $text_wishlist; ?></a>
			</div>
			<div class="btn-group">
				<a class="btn" href="<?php echo $header_product_compare_link; ?>" id="compare-total"><?php echo $header_product_compare; ?></a>
			</div>
		</div>
	</div>
		
  <div class="container">
    <div class="row">
      <div class="col-sm-12 col-md-3">
        <div id="logo">
          <?php if ($logo) { ?>
						<a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
          <?php } else { ?>
					<div class="btn-group btn-block">
						<button type="button" class="btn btn-link btn-block">
							<a href="<?php echo $home; ?>"><?php echo $name; ?></a>
						</button>
					</div>
          <?php } ?>
				</div>
      </div>
			<div class="col-sm-12 col-md-3 text-center text-left-md">
				<div id="phone">
					<div class="phone"><span class="glyphicon glyphicon-phone-alt icon"></span>&nbsp;&nbsp;<?php echo $telephone; ?></div>
				</div>
			</div>
			<div class="col-sm-12 col-md-6 text-center text-right-md">
				<div id="header-menu">
				<?php if (isset($header_menu) & !empty($header_menu)) {?>
					<?php if ($header_menu['status'] == 1) {?>
						<?php if (isset($header_menu['cust_menu_item'])) { ?>
							<?php foreach ($header_menu['cust_menu_item'] as $item) { ?>
								<a class="btn" href="<?php echo $item['link'][$language_id]; ?>">
									<span><?php echo html_entity_decode($item['title'][$language_id], ENT_QUOTES, 'UTF-8'); ?></span>
								</a>
							<?php } ?>
						<?php } ?>
					<?php }?>
				<?php }?>
				</div>
			</div>
    </div>
  </div>
	<div class="container">
		<div class="row menu-line">
			<div class="col-sm-12 col-md-7 col-md-push-3"><?php echo $search; ?></div>
			<div class="col-sm-6 col-sm-push-6 col-md-2 col-md-push-3"><?php echo $cart; ?></div>
			<div class="col-sm-6 col-sm-pull-6 col-md-3 col-md-pull-9">
				<?php if ($categories) { ?>
				<nav id="menu" class="btn-group btn-block">
					<button type="button" class="btn btn-danger btn-block dropdown-toggle" data-toggle="dropdown">
						<i class="fa fa-bars"></i>
						<?php echo $text_category; ?>
					</button>
					<ul id="menu-list" class="dropdown-menu">
						<?php foreach ($categories as $category) { ?>
						<?php if ($category['children']) { ?>
						<li>
							<span class="pull-right toggle-child">
								<i class="fa fa-plus plus"></i>
								<i class="fa fa-minus minus"></i>
							</span>
							<a class="with-child" href="<?php echo $category['href']; ?>">
								<i class="fa fa-angle-right arrow"></i>
								<?php echo $category['name']; ?>
							</a>
							<ul class="child-box">
								<?php foreach ($category['children'] as $child) { ?>
								<li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
								<?php } ?>
							</ul>
						</li>
						<?php } else { ?>
						<li>
							<a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
						</li>
						<?php } ?>
						<?php } ?>
					</ul>
				</nav>
				<?php } ?>
			</div>
		</div>
	</div>
	
	<script>
		$(".child-box").hover(function() {$(this).parent().find('.with-child').toggleClass('hover');});
		$(".toggle-child").click(function() {$(this).toggleClass('open'); $(this).parent().find('.child-box').slideToggle(200);});
		$( '#menu-list li:has(ul)' ).doubleTapToGo();
	</script>
</header>