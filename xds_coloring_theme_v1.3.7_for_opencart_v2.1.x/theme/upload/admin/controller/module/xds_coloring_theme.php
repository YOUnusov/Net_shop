<?php
class ControllerModuleXdsColoringTheme extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('module/xds_coloring_theme');

		$this->document->setTitle($this->language->get('heading_title'));
		$this->document->addStyle('view/stylesheet/xds_coloring_theme.css');

		
		$this->load->model('coloring/coloring');
		$this->load->model('design/layout');
		
		$this->load->model('localisation/language');

		$data['languages'] = $this->model_localisation_language->getLanguages();
		$data['language_id'] = $this->config->get('config_language_id');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_coloring_coloring->changeColoringTheme('xds_coloring_theme', $this->request->post);
			if ($this->lic_validate()) {
				$this->session->data['success'] = $this->language->get('text_success');
				$this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
			}
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}		

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_module'),
			'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('module/xds_coloring_theme', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['action'] = $this->url->link('module/xds_coloring_theme', 'token=' . $this->session->data['token'], 'SSL');

		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
		
		$data['token'] = $this->session->data['token'];
		
		
		// help header menu
		if (isset($this->request->post['xds_coloring_theme_help_menu_toggle'])) {
			$data['xds_coloring_theme_help_menu_toggle'] = $this->request->post['xds_coloring_theme_help_menu_toggle'];
		} else {
			$data['xds_coloring_theme_help_menu_toggle'] = $this->config->get('xds_coloring_theme_help_menu_toggle');
		}
		
		if (isset($this->request->post['xds_coloring_theme_help_menu_text'])) {
			$data['xds_coloring_theme_help_menu_text'] = $this->request->post['xds_coloring_theme_help_menu_text'];
		} else {
			$data['xds_coloring_theme_help_menu_text'] = $this->config->get('xds_coloring_theme_help_menu_text');
		}
		
		if (isset($this->request->post['xds_coloring_theme_help_menu_left'])) {
			$data['xds_coloring_theme_help_menu_left'] = $this->request->post['xds_coloring_theme_help_menu_left'];
		} else {
			$data['xds_coloring_theme_help_menu_left'] = $this->config->get('xds_coloring_theme_help_menu_left');
		}
		
		if (isset($this->request->post['xds_coloring_theme_help_menu_item'])) {
			$results = $this->request->post['xds_coloring_theme_help_menu_item'];
		} elseif ($this->config->get('xds_coloring_theme_help_menu_item')) {
			$results = $this->config->get('xds_coloring_theme_help_menu_item');
		} else {
			$results = array();
		}

		$data['xds_coloring_theme_help_menu_items'] = array();
		
		foreach ($results as $result) {
			$data['xds_coloring_theme_help_menu_items'][] = array(
					'title' => $result['title'],
					'link'  => $result['link'],
					'sort'  => $result['sort']
				);	
			} 
		
		
		// main header menu
		if (isset($this->request->post['xds_coloring_theme_main_menu_toggle'])) {
			$data['xds_coloring_theme_main_menu_toggle'] = $this->request->post['xds_coloring_theme_main_menu_toggle'];
		} else {
			$data['xds_coloring_theme_main_menu_toggle'] = $this->config->get('xds_coloring_theme_main_menu_toggle');
		}
		
		if (isset($this->request->post['xds_coloring_theme_main_menu_item'])) {
			$results = $this->request->post['xds_coloring_theme_main_menu_item'];
		} elseif ($this->config->get('xds_coloring_theme_main_menu_item')) {
			$results = $this->config->get('xds_coloring_theme_main_menu_item');
		} else {
			$results = array();
		}

		$data['xds_coloring_theme_main_menu_items'] = array();
		
		foreach ($results as $result) {
			$data['xds_coloring_theme_main_menu_items'][] = array(
					'title' => $result['title'],
					'link'  => $result['link'],
					'sort'  => $result['sort']
				);	
			}
			
		// add links to category
		
		if (isset($this->request->post['xds_coloring_theme_category_mask_toggle'])) {
			$data['xds_coloring_theme_category_mask_toggle'] = $this->request->post['xds_coloring_theme_category_mask_toggle'];
		} else {
			$data['xds_coloring_theme_category_mask_toggle'] = $this->config->get('xds_coloring_theme_category_mask_toggle');
		}
		
		if (isset($this->request->post['xds_coloring_theme_add_cat_links_toggle'])) {
			$data['xds_coloring_theme_add_cat_links_toggle'] = $this->request->post['xds_coloring_theme_add_cat_links_toggle'];
		} else {
			$data['xds_coloring_theme_add_cat_links_toggle'] = $this->config->get('xds_coloring_theme_add_cat_links_toggle');
		}
		
		if (isset($this->request->post['xds_coloring_theme_add_cat_links_item'])) {
			$results = $this->request->post['xds_coloring_theme_add_cat_links_item'];
		} elseif ($this->config->get('xds_coloring_theme_add_cat_links_item')) {
			$results = $this->config->get('xds_coloring_theme_add_cat_links_item');
		} else {
			$results = array();
		}

		$data['xds_coloring_theme_add_cat_links_items'] = array();
		
		foreach ($results as $result) {
			$data['xds_coloring_theme_add_cat_links_items'][] = array(
					'title' => $result['title'],
					'link'  => $result['link'],
					'sort'  => $result['sort']
				);	
			}

		// pay icons banner

		if (isset($this->request->post['xds_coloring_theme_pay_icons_toggle'])) {
			$data['xds_coloring_theme_pay_icons_toggle'] = $this->request->post['xds_coloring_theme_pay_icons_toggle'];
		} else {
			$data['xds_coloring_theme_pay_icons_toggle'] = $this->config->get('xds_coloring_theme_pay_icons_toggle');
		}
		
		if (isset($this->request->post['xds_coloring_theme_pay_icons_banner_id'])) {
			$data['xds_coloring_theme_pay_icons_banner_id'] = $this->request->post['xds_coloring_theme_pay_icons_banner_id'];
		} elseif ($this->config->get('xds_coloring_theme_pay_icons_banner_id')) {
			$data['xds_coloring_theme_pay_icons_banner_id'] = $this->config->get('xds_coloring_theme_pay_icons_banner_id');
		} else {
			$data['xds_coloring_theme_pay_icons_banner_id'] = '';
		}
			
		$this->load->model('design/banner');
		$data['banners'] = $this->model_design_banner->getBanners();
		
		// footer map code
		
		if (isset($this->request->post['xds_coloring_theme_footer_map_toggle'])) {
			$data['xds_coloring_theme_footer_map_toggle'] = $this->request->post['xds_coloring_theme_footer_map_toggle'];
		} else {
			$data['xds_coloring_theme_footer_map_toggle'] = $this->config->get('xds_coloring_theme_footer_map_toggle');
		}
		
		if (isset($this->request->post['xds_coloring_theme_footer_map'])) {
			$data['xds_coloring_theme_footer_map'] = $this->request->post['xds_coloring_theme_help_menu_text'];
		} else {
			$data['xds_coloring_theme_footer_map'] = $this->config->get('xds_coloring_theme_footer_map');
		}
		
		
		// contacts header
		
		if (isset($this->request->post['xds_coloring_theme_contact_main_toggle'])) {
			$data['xds_coloring_theme_contact_main_toggle'] = $this->request->post['xds_coloring_theme_contact_main_toggle'];
		} else {
			$data['xds_coloring_theme_contact_main_toggle'] = $this->config->get('xds_coloring_theme_contact_main_toggle');
		}
		
		if (isset($this->request->post['xds_coloring_theme_contact_add_toggle'])) {
			$data['xds_coloring_theme_contact_add_toggle'] = $this->request->post['xds_coloring_theme_contact_add_toggle'];
		} else {
			$data['xds_coloring_theme_contact_add_toggle'] = $this->config->get('xds_coloring_theme_contact_add_toggle');
		}
		
		if (isset($this->request->post['xds_coloring_theme_contact_main_phone'])) {
			$data['xds_coloring_theme_contact_main_phone'] = $this->request->post['xds_coloring_theme_contact_main_phone'];
		} else {
			$data['xds_coloring_theme_contact_main_phone'] = $this->config->get('xds_coloring_theme_contact_main_phone');
		}
		
		if (isset($this->request->post['xds_coloring_theme_contact_hint'])) {
			$data['xds_coloring_theme_contact_hint'] = $this->request->post['xds_coloring_theme_contact_hint'];
		} else {
			$data['xds_coloring_theme_contact_hint'] = $this->config->get('xds_coloring_theme_contact_hint');
		}
		
		$this->load->model('tool/image');
		
		if (isset($this->request->post['xds_coloring_theme_header_contact'])) {
			$results = $this->request->post['xds_coloring_theme_header_contact'];
		} elseif ($this->config->get('xds_coloring_theme_header_contact')) {
			$results = $this->config->get('xds_coloring_theme_header_contact');
		} else {
			$results = array();
		}

		$data['xds_coloring_theme_header_contacts'] = array();
		
		foreach ($results as $result) {
		
			if (is_file(DIR_IMAGE . $result['image'])) {
				$image = $result['image'];
				$thumb = $result['image'];
			} else {
				$image = '';
				$thumb = 'no_image.png';
			}
		
			$data['xds_coloring_theme_header_contacts'][] = array(
				'image' => $image,
				'thumb' => $this->model_tool_image->resize($thumb, 60, 60),
				'title' => $result['title'],
				'sort'  => $result['sort']
			);	
		} 
		
		$data['placeholder'] = $this->model_tool_image->resize('no_image.png', 60, 60);
		
		
		if (isset($this->request->post['xds_coloring_theme_contact_email'])) {
			$data['xds_coloring_theme_contact_email'] = $this->request->post['xds_coloring_theme_contact_email'];
		} else {
			$data['xds_coloring_theme_contact_email'] = $this->config->get('xds_coloring_theme_contact_email');
		}
		
		if (isset($this->request->post['xds_coloring_theme_schedule'])) {
			$data['xds_coloring_theme_schedule'] = $this->request->post['xds_coloring_theme_schedule'];
		} else {
			$data['xds_coloring_theme_schedule'] = $this->config->get('xds_coloring_theme_schedule');
		}
		
		if (isset($this->request->post['xds_coloring_theme_additional_contact'])) {
			$results = $this->request->post['xds_coloring_theme_additional_contact'];
		} elseif ($this->config->get('xds_coloring_theme_additional_contact')) {
			$results = $this->config->get('xds_coloring_theme_additional_contact');
		} else {
			$results = array();
		}

		$data['xds_coloring_theme_additional_contacts'] = array();
		
		foreach ($results as $result) {
		
			if (is_file(DIR_IMAGE . $result['image'])) {
				$image = $result['image'];
				$thumb = $result['image'];
			} else {
				$image = '';
				$thumb = 'no_image.png';
			}
		
			$data['xds_coloring_theme_additional_contacts'][] = array(
				'image' => $image,
				'thumb' => $this->model_tool_image->resize($thumb, 60, 60),
				'link' => $result['link'],
				'title' => $result['title'],
				'sort'  => $result['sort']
			);	
		} 
		
		
		// instaled modules
		
		if (isset($this->request->post['xds_coloring_theme_new_home_layout_module'])) {
			$data['xds_coloring_theme_new_home_layout_modules'] = $this->request->post['xds_coloring_theme_new_home_layout_module'];
		} elseif ($this->config->get('xds_coloring_theme_new_home_layout_module')) {
			$data['xds_coloring_theme_new_home_layout_modules'] = $this->config->get('xds_coloring_theme_new_home_layout_module');
		} else {
			$data['xds_coloring_theme_new_home_layout_modules'] = array();
		}

		$this->load->model('extension/extension');

		$this->load->model('extension/module');

		$data['xds_coloring_theme_new_home_extensions'] = array();

		// Get a list of installed modules
		$new_home_extensions = $this->model_extension_extension->getInstalled('module');

		// Add all the modules which have multiple settings for each module
		foreach ($new_home_extensions as $code) {
			$this->load->language('module/' . $code);

			$module_data = array();

			$modules = $this->model_extension_module->getModulesByCode($code);

			foreach ($modules as $module) {
				$module_data[] = array(
					'name' => $this->language->get('heading_title') . ' &gt; ' . $module['name'],
					'code' => $code . '.' .  $module['module_id']
				);
			}

			if ($this->config->has($code . '_status') || $module_data) {
				$data['xds_coloring_theme_new_home_extensions'][] = array(
					'name'   => $this->language->get('heading_title'),
					'code'   => $code,
					'module' => $module_data
				);
			}
		}
		
		
		
		if (isset($this->request->post['xds_coloring_theme_left_subcategory'])) {
			$data['xds_coloring_theme_left_subcategory'] = $this->request->post['xds_coloring_theme_left_subcategory'];
		} else {
			$data['xds_coloring_theme_left_subcategory'] = $this->config->get('xds_coloring_theme_left_subcategory');
		}
		
		if (isset($this->request->post['xds_coloring_theme_category_description_position'])) {
			$data['xds_coloring_theme_category_description_position'] = $this->request->post['xds_coloring_theme_category_description_position'];
		} else {
			$data['xds_coloring_theme_category_description_position'] = $this->config->get('xds_coloring_theme_category_description_position');
		}
		
		if (isset($this->request->post['xds_coloring_theme_product_short_description'])) {
			$data['xds_coloring_theme_product_short_description'] = $this->request->post['xds_coloring_theme_product_short_description'];
		} else {
			$data['xds_coloring_theme_product_short_description'] = $this->config->get('xds_coloring_theme_product_short_description');
		}
		
		if (isset($this->request->post['xds_coloring_theme_product_short_attributes'])) {
			$data['xds_coloring_theme_product_short_attributes'] = $this->request->post['xds_coloring_theme_product_short_attributes'];
		} else {
			$data['xds_coloring_theme_product_short_attributes'] = $this->config->get('xds_coloring_theme_product_short_attributes');
		}
		
		if (isset($this->request->post['xds_coloring_theme_product_social_likes'])) {
			$data['xds_coloring_theme_product_social_likes'] = $this->request->post['xds_coloring_theme_product_social_likes'];
		} else {
			$data['xds_coloring_theme_product_social_likes'] = $this->config->get('xds_coloring_theme_product_social_likes');
		}
		
		if (isset($this->request->post['xds_coloring_theme_related_product_position'])) {
			$data['xds_coloring_theme_related_product_position'] = $this->request->post['xds_coloring_theme_related_product_position'];
		} else {
			$data['xds_coloring_theme_related_product_position'] = $this->config->get('xds_coloring_theme_related_product_position');
		}
		
		
		if (isset($this->request->post['xds_coloring_theme_disable_cart_button'])) {
			$data['xds_coloring_theme_disable_cart_button'] = $this->request->post['xds_coloring_theme_disable_cart_button'];
		} else {
			$data['xds_coloring_theme_disable_cart_button'] = $this->config->get('xds_coloring_theme_disable_cart_button');
		}
		
		if (isset($this->request->post['xds_coloring_theme_disable_cart_button_text'])) {
			$data['xds_coloring_theme_disable_cart_button_text'] = $this->request->post['xds_coloring_theme_disable_cart_button_text'];
		} else {
			$data['xds_coloring_theme_disable_cart_button_text'] = $this->config->get('xds_coloring_theme_disable_cart_button_text');
		}
		
		if (isset($this->request->post['xds_coloring_theme_col_left_button_text'])) {
			$data['xds_coloring_theme_col_left_button_text'] = $this->request->post['xds_coloring_theme_col_left_button_text'];
		} else {
			$data['xds_coloring_theme_col_left_button_text'] = $this->config->get('xds_coloring_theme_col_left_button_text');
		}
		
		if (isset($this->request->post['xds_coloring_theme_col_right_button_text'])) {
			$data['xds_coloring_theme_col_right_button_text'] = $this->request->post['xds_coloring_theme_col_right_button_text'];
		} else {
			$data['xds_coloring_theme_col_right_button_text'] = $this->config->get('xds_coloring_theme_col_right_button_text');
		}
		
		
		

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('module/xds_coloring_theme.tpl', $data));
	}
	
	protected function lic_validate() {
		if (!empty($this->session->data['lic_err'])) {
			$this->error['warning'] = $this->session->data['lic_err'];
		}
		return !$this->error;
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/xds_coloring_theme')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		return !$this->error;
	}
}