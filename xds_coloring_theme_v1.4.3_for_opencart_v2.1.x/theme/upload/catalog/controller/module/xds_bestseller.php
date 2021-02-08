<?php
class ControllerModuleXDSBestSeller extends Controller {
	public function index($setting) {
		$this->load->language('module/xds_bestseller');
		$language_id = $this->config->get('config_language_id');

		if ($setting['title'][$language_id]) {
			$data['heading_title'] = html_entity_decode($setting['title'][$language_id], ENT_QUOTES, 'UTF-8');
		} else {
			$data['heading_title'] = $this->language->get('heading_title');
		}
		
		$data['exclude'] = $setting['exclude'];
		$data['shuffle'] = $setting['shuffle'];
		$data['autoplay'] = $setting['autoplay'];
		$data['autoplay_speed'] = $setting['autoplay_speed'];
		
		$this->load->model('setting/setting');
		$xds_coloring = array();
		$xds_coloring = $this->model_setting_setting->getSetting('xds_coloring_theme');
		
		$data['disable_cart_button'] = false;
		if (isset($xds_coloring['disable_cart_button'])) {
			$data['disable_cart_button'] = $xds_coloring['disable_cart_button'];
		}
		$data['disable_cart_button_text'] = "";
		if (isset($xds_coloring['disable_cart_button_text'])) {
			$data['disable_cart_button_text'] = $xds_coloring['disable_cart_button_text'][$language_id];
		}
		
		$data['on_off_qview'] = false;
		if (isset($xds_coloring['on_off_qview'])) {
			$data['on_off_qview'] = $xds_coloring['on_off_qview'];
		}
		
		$this->load->language('coloring/coloring');
		$data['qview_text'] = $this->language->get('qview_text');
		
		$data['text_days'] = $this->language->get('text_days');
		$data['text_tax'] = $this->language->get('text_tax');
		$data['button_cart'] = $this->language->get('button_cart');
		$data['button_wishlist'] = $this->language->get('button_wishlist');
		$data['button_compare'] = $this->language->get('button_compare');

		$this->load->model('catalog/product');

		$this->load->model('tool/image');
		
		$this->load->model('coloring/coloring');
		
		static $module = 0;
		
		$this->document->addScript('catalog/view/theme/coloring/assets/jquery.countdown-2.1.0/jquery.countdown.min.js');
		
		$this->document->addScript('catalog/view/theme/coloring/assets/owl-carousel/owl.carousel.min.js');
		$this->document->addStyle('catalog/view/theme/coloring/assets/owl-carousel/owl.carousel.css');
		$this->document->addStyle('catalog/view/theme/coloring/assets/owl-carousel/owl.theme.css');
		
		$this->document->addScript('catalog/view/javascript/jquery/datetimepicker/moment.js');
		$this->document->addScript('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js');
		$this->document->addStyle('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css');
		
		$this->document->addScript('catalog/view/javascript/jquery/datetimepicker/moment.js');
		$this->document->addScript('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js');
		$this->document->addStyle('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css');

		$data['products'] = array();

		$results = $this->model_catalog_product->getBestSellerProducts($setting['limit']);

		if ($results) {
			foreach ($results as $result) {
				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height']);
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
				}

				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$price = false;
				}

				if ((float)$result['special']) {
					$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$special = false;
				}
				
				if ($price && $special) {
						$discount = round(100 - ($result['special'] / $result['price']) * 100) * (-1);
					} else {
						$discount = false;
					}

				if ($this->config->get('config_tax')) {
					$tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price']);
				} else {
					$tax = false;
				}

				if ($this->config->get('config_review_status')) {
					$rating = $result['rating'];
				} else {
					$rating = false;
				}
				
				$date_end = $this->model_coloring_coloring->getSpecialEndDate($result['product_id']);

				$data['products'][] = array(
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'quantity'  	=> $result['quantity'],
					'name'        => $result['name'],
					'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('config_product_description_length')) . '..',
					'price'       => $price,
					'special'     => $special,
					'date_end'   => $date_end,
					'discount'     => $discount,
					'tax'         => $tax,
					'rating'      => $rating,
					'qview'     => 'index.php?route=product/xds_qview&product_id=' . $result['product_id'],
					'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id'])
				);
			}
			
			$data['module'] = $module++;
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/xds_bestseller.tpl')) {
				return $this->load->view($this->config->get('config_template') . '/template/module/xds_bestseller.tpl', $data);
			} else {
				return $this->load->view('default/template/module/xds_bestseller.tpl', $data);
			}
		}
	}
}