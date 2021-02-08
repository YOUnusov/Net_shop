<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-xds-latest" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-xds-latest" class="form-horizontal">
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
            <div class="col-sm-10">
              <input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
              <?php if ($error_name) { ?>
              <div class="text-danger"><?php echo $error_name; ?></div>
              <?php } ?>
            </div>
          </div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
						<div class="col-sm-10">
							<select name="status" id="input-status" class="form-control">
								<?php if ($status) { ?>
								<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
								<option value="0"><?php echo $text_disabled; ?></option>
								<?php } else { ?>
								<option value="1"><?php echo $text_enabled; ?></option>
								<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
								<?php } ?>
							</select>
						</div>
					</div>
					<div class="form-group">
            <label class="col-sm-2 control-label" for="input-title"><?php echo $entry_title; ?></label>
            <div class="col-sm-10">
						<?php foreach ($languages as $language) { ?>
							<div class="input-group pull-left">
								<span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
								<input type="text" name="title[<?php echo $language['language_id']; ?>]" value="<?php echo $title[$language['language_id']]; ?>" placeholder="<?php echo $entry_title; ?>" id="input-title" class="form-control" />
							</div>
							<?php } ?>
            </div>
          </div> 
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-limit"><?php echo $entry_limit; ?></label>
            <div class="col-sm-10">
              <input type="text" name="limit" value="<?php echo $limit; ?>" placeholder="<?php echo $entry_limit; ?>" id="input-limit" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-width"><?php echo $entry_width; ?></label>
            <div class="col-sm-10">
              <input type="text" name="width" value="<?php echo $width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-width" class="form-control" />
              <?php if ($error_width) { ?>
              <div class="text-danger"><?php echo $error_width; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-height"><?php echo $entry_height; ?></label>
            <div class="col-sm-10">
              <input type="text" name="height" value="<?php echo $height; ?>" placeholder="<?php echo $entry_height; ?>" id="input-height" class="form-control" />
              <?php if ($error_height) { ?>
              <div class="text-danger"><?php echo $error_height; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-exclude"><?php echo $entry_exclude; ?></label>
            <div class="col-sm-10">
							<label class="radio-inline">
								<input type="radio" name="exclude" value="1" <?php if ($exclude) {echo 'checked';}; ?> /> Да
							</label>
							<label class="radio-inline">
								<input type="radio" name="exclude" value="0" <?php if (!$exclude) {echo 'checked';}; ?> /> Нет
							</label>
            </div>
          </div>
					<div class="form-group">
            <label class="col-sm-2 control-label" for="input-shuffle"><?php echo $entry_shuffle; ?></label>
            <div class="col-sm-10">
							<label class="radio-inline">
								<input type="radio" name="shuffle" value="1" <?php if ($shuffle) {echo 'checked';}; ?> /> Да
							</label>
							<label class="radio-inline">
								<input type="radio" name="shuffle" value="0" <?php if (!$shuffle) {echo 'checked';}; ?> /> Нет
							</label>
            </div>
          </div>
					<div class="form-group">
            <label class="col-sm-2 control-label" for="input-autoplay"><?php echo $entry_autoplay; ?></label>
            <div class="col-sm-10">
							<label class="radio-inline">
								<input type="radio" name="autoplay" value="1" <?php if ($autoplay) {echo 'checked';}; ?> /> Да
							</label>
							<label class="radio-inline">
								<input type="radio" name="autoplay" value="0" <?php if (!$autoplay) {echo 'checked';}; ?> /> Нет
							</label>
            </div>
          </div>
					<div class="form-group">
            <label class="col-sm-2 control-label" for="input-autoplay-speed"><?php echo $entry_autoplay_speed; ?></label>
            <div class="col-sm-10">
              <input type="text" name="autoplay_speed" value="<?php echo $autoplay_speed; ?>" placeholder="<?php echo strip_tags($entry_autoplay_speed); ?>" id="input-autoplay-speed" class="form-control" />
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?>