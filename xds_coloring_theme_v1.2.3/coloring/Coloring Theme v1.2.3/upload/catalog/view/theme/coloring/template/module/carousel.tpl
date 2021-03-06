<div id="carousel<?php echo $module; ?>" class="carousel" alt="<?php echo $alt_text; ?>">
  <?php foreach ($banners as $banner) { ?>
  <div class="item text-center">
    <?php if ($banner['link']) { ?>
    <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" /></a>
    <?php } else { ?>
    <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" />
    <?php } ?>
  </div>
  <?php } ?>
</div>
<script type="text/javascript">
	$('#carousel<?php echo $module; ?>').owlCarousel({
		itemsCustom: [[0, 1], [448, 2], [668, 3], [848, 4], [1000, 5]],
		autoPlay: 3000,
		navigation: true,
		theme: 'carousel',
		navigationText: ['<i class="fa fa-chevron-left"></i>', '<i class="fa fa-chevron-right"></i>'],
		pagination: false
	});
</script>