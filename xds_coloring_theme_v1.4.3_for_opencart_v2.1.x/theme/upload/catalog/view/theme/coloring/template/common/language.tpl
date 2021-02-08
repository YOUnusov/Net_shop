<?php if (count($languages) > 1) { ?>
<div class="pull-left">
<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="language">
  <div class="btn-group">
    <button class="btn dropdown-toggle" data-toggle="dropdown">
    <?php foreach ($languages as $language) { ?>
    <?php if ($language['code'] == $code) { ?>
    <i class="fa fa-globe icon"></i><span class="hidden-xs hidden-sm">&nbsp;&nbsp;<?php echo $language['name']; ?>&nbsp;</span>&nbsp;<span class="fa fa fa-angle-down caretalt"></span></button>
    <?php } ?>
    <?php } ?>
    
    <ul class="dropdown-menu">
      <?php foreach ($languages as $language) { ?>
			<?php if ($language['code'] != $code) { ?>
      <li><a href="<?php echo $language['code']; ?>">&nbsp;&nbsp;<?php echo $language['name']; ?></a></li>
			<?php } ?>
      <?php } ?>
    </ul>
  </div>
  <input type="hidden" name="code" value="" />
  <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
</form>
</div>
<?php } ?>
