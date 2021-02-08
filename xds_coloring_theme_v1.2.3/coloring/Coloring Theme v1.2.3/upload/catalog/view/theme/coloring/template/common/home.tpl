<?php echo $header; ?>
<div class="container">
  <div class="row">
		<div class="col-md-3"><div id="menu-home-helper"></div></div>
		<div class="col-md-9"><?php echo $content_top; ?></div>
	</div>
	<div class="row">
		<?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-4 col-md-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-8 col-md-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>">
			<?php echo $content_bottom; ?>
		</div>
    <?php echo $column_right; ?>
	</div>
	<div class="row">
		<div class="col-md-12">
			<div id="home-bottom-carousel">
				<?php foreach ($hbc_banners as $hbc_banner) { ?>
				<div class="item text-center">
					<?php if ($hbc_banner['link']) { ?>
					<a href="<?php echo $hbc_banner['link']; ?>"><img src="<?php echo $hbc_banner['image']; ?>" alt="<?php echo $hbc_banner['title']; ?>" class="img-responsive" /></a>
					<?php } else { ?>
					<img src="<?php echo $hbc_banner['image']; ?>" alt="<?php echo $hbc_banner['title']; ?>" class="img-responsive" />
					<?php } ?>
				</div>
				<?php } ?>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	$(function(){
		$('#menu-home-helper').css({'min-height': $('#menu-list').outerHeight() - 20});
	});
	
	$('#home-bottom-carousel').owlCarousel({
		items: 6,
		autoPlay: 3000,
		navigation: true,
		theme: 'carousel',
		navigationText: ['<i class="fa fa-chevron-left"></i>', '<i class="fa fa-chevron-right"></i>'],
		pagination: false
	});
</script>
<?php echo $footer; ?>