<div class="form-group required">
  <?php if (substr($route, 0, 9) == 'checkout/') { ?>
  <label class="control-label" for="input-payment-captcha"><?php echo $entry_captcha; ?></label>
  <input type="text" name="captcha" id="input-payment-captcha" class="form-control" />
  <img src="index.php?route=captcha/basic_captcha/captcha" alt="" />
 <?php } else { ?>
  <label class="col-sm-2 control-label" for="input-captcha"><?php echo $entry_captcha; ?></label>
  <div class="col-sm-10">
		<div class="form-inline">
		<div class="input-group">
			<label class="bsic-capcha-wrapper input-group-addon" for="input-captcha">
				<img src="index.php?route=captcha/basic_captcha/captcha" alt="" />
			</label>
			<input type="text" name="captcha" id="input-captcha" class="form-control" />
		</div>
		</div>	
    <?php if ($error_captcha) { ?>
    <div class="text-danger"><?php echo $error_captcha; ?></div>
    <?php } ?>
  </div>
  <?php } ?>
</div>
