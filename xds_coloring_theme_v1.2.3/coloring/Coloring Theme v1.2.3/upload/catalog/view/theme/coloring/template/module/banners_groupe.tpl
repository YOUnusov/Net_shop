<div class="row banners-groupe"> 
	<?php foreach ($banners as $banner) { ?>
  <div class="col-xs-4">
    <?php if ($banner['link']) { ?>
    <div class="banner-box">
			<a href="<?php echo $banner['link']; ?>">
				<img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" />
			</a>
		</div>
    <?php } else { ?>
		<div class="banner-box">
			<img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" />
		</div>
    <?php } ?>
  </div>
  <?php } ?>
</div>