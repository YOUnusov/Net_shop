<?php
class ControllerModuleXdsColoringTheme extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('module/xds_coloring_theme');

		$this->document->setTitle(strip_tags($this->language->get('heading_title')));
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

		$data['heading_title'] = strip_tags($this->language->get('heading_title'));

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
			'text' => strip_tags($this->language->get('heading_title')),
			'href' => $this->url->link('module/xds_coloring_theme', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['action'] = $this->url->link('module/xds_coloring_theme', 'token=' . $this->session->data['token'], 'SSL');

		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
		
		$data['token'] = $this->session->data['token'];
		
		
		// help header menu
		if (isset($this->request->post['help_menu_toggle'])) {
			$data['help_menu_toggle'] = $this->request->post['help_menu_toggle'];
		} else {
			$data['help_menu_toggle'] = $this->config->get('help_menu_toggle');
		}
		
		if (isset($this->request->post['help_menu_text'])) {
			$data['help_menu_text'] = $this->request->post['help_menu_text'];
		} else {
			$data['help_menu_text'] = $this->config->get('help_menu_text');
		}
		
		if (isset($this->request->post['help_menu_left'])) {
			$data['help_menu_left'] = $this->request->post['help_menu_left'];
		} else {
			$data['help_menu_left'] = $this->config->get('help_menu_left');
		}
		
		if (isset($this->request->post['help_menu_item'])) {
			$results = $this->request->post['help_menu_item'];
		} elseif ($this->config->get('help_menu_item')) {
			$results = $this->config->get('help_menu_item');
		} else {
			$results = array();
		}

		$data['help_menu_items'] = array();
		
		foreach ($results as $result) {
			$data['help_menu_items'][] = array(
					'title' => $result['title'],
					'link'  => $result['link'],
					'sort'  => $result['sort']
				);	
			} 
		
		
		// main header menu
		if (isset($this->request->post['main_menu_toggle'])) {
			$data['main_menu_toggle'] = $this->request->post['main_menu_toggle'];
		} else {
			$data['main_menu_toggle'] = $this->config->get('main_menu_toggle');
		}
		
		if (isset($this->request->post['main_menu_item'])) {
			$results = $this->request->post['main_menu_item'];
		} elseif ($this->config->get('main_menu_item')) {
			$results = $this->config->get('main_menu_item');
		} else {
			$results = array();
		}

		$data['main_menu_items'] = array();
		
		foreach ($results as $result) {
			$data['main_menu_items'][] = array(
					'title' => $result['title'],
					'link'  => $result['link'],
					'sort'  => $result['sort']
				);	
			}
			
		// add links to category
		
		if (isset($this->request->post['category_mask_toggle'])) {
			$data['category_mask_toggle'] = $this->request->post['category_mask_toggle'];
		} else {
			$data['category_mask_toggle'] = $this->config->get('category_mask_toggle');
		}
		
		if (isset($this->request->post['add_cat_links_toggle'])) {
			$data['add_cat_links_toggle'] = $this->request->post['add_cat_links_toggle'];
		} else {
			$data['add_cat_links_toggle'] = $this->config->get('add_cat_links_toggle');
		}
		
		if (isset($this->request->post['add_cat_links_item'])) {
			$results = $this->request->post['add_cat_links_item'];
		} elseif ($this->config->get('add_cat_links_item')) {
			$results = $this->config->get('add_cat_links_item');
		} else {
			$results = array();
		}

		$data['add_cat_links_items'] = array();
		
		foreach ($results as $result) {
			$data['add_cat_links_items'][] = array(
					'title' => $result['title'],
					'link'  => $result['link'],
					'sort'  => $result['sort']
				);	
			}

		// pay icons banner

		if (isset($this->request->post['pay_icons_toggle'])) {
			$data['pay_icons_toggle'] = $this->request->post['pay_icons_toggle'];
		} else {
			$data['pay_icons_toggle'] = $this->config->get('pay_icons_toggle');
		}
		
		if (isset($this->request->post['pay_icons_banner_id'])) {
			$data['pay_icons_banner_id'] = $this->request->post['pay_icons_banner_id'];
		} elseif ($this->config->get('pay_icons_banner_id')) {
			$data['pay_icons_banner_id'] = $this->config->get('pay_icons_banner_id');
		} else {
			$data['pay_icons_banner_id'] = '';
		}
			
		$this->load->model('design/banner');
		$data['banners'] = $this->model_design_banner->getBanners();
		
		// footer map code
		
		if (isset($this->request->post['footer_map_toggle'])) {
			$data['footer_map_toggle'] = $this->request->post['footer_map_toggle'];
		} else {
			$data['footer_map_toggle'] = $this->config->get('footer_map_toggle');
		}
		
		if (isset($this->request->post['footer_map'])) {
			$data['footer_map'] = $this->request->post['help_menu_text'];
		} else {
			$data['footer_map'] = $this->config->get('footer_map');
		}
		
		
		// contacts header
		
		if (isset($this->request->post['contact_main_toggle'])) {
			$data['contact_main_toggle'] = $this->request->post['contact_main_toggle'];
		} else {
			$data['contact_main_toggle'] = $this->config->get('contact_main_toggle');
		}
		
		if (isset($this->request->post['contact_add_toggle'])) {
			$data['contact_add_toggle'] = $this->request->post['contact_add_toggle'];
		} else {
			$data['contact_add_toggle'] = $this->config->get('contact_add_toggle');
		}
		
		if (isset($this->request->post['contact_main_phone'])) {
			$data['contact_main_phone'] = $this->request->post['contact_main_phone'];
		} else {
			$data['contact_main_phone'] = $this->config->get('contact_main_phone');
		}
		
		if (isset($this->request->post['contact_hint'])) {
			$data['contact_hint'] = $this->request->post['contact_hint'];
		} else {
			$data['contact_hint'] = $this->config->get('contact_hint');
		}
		
		$this->load->model('tool/image');
		
		if (isset($this->request->post['header_contact'])) {
			$results = $this->request->post['header_contact'];
		} elseif ($this->config->get('header_contact')) {
			$results = $this->config->get('header_contact');
		} else {
			$results = array();
		}

		$data['header_contacts'] = array();
		
		foreach ($results as $result) {
		
			if (is_file(DIR_IMAGE . $result['image'])) {
				$image = $result['image'];
				$thumb = $result['image'];
			} else {
				$image = '';
				$thumb = 'no_image.png';
			}
		
			$data['header_contacts'][] = array(
				'image' => $image,
				'thumb' => $this->model_tool_image->resize($thumb, 60, 60),
				'title' => $result['title'],
				'sort'  => $result['sort']
			);	
		} 
		
		$data['placeholder'] = $this->model_tool_image->resize('no_image.png', 60, 60);
		
		
		if (isset($this->request->post['contact_email'])) {
			$data['contact_email'] = $this->request->post['contact_email'];
		} else {
			$data['contact_email'] = $this->config->get('contact_email');
		}
		
		if (isset($this->request->post['schedule'])) {
			$data['schedule'] = $this->request->post['schedule'];
		} else {
			$data['schedule'] = $this->config->get('schedule');
		}
		
		if (isset($this->request->post['additional_contact'])) {
			$results = $this->request->post['additional_contact'];
		} elseif ($this->config->get('additional_contact')) {
			$results = $this->config->get('additional_contact');
		} else {
			$results = array();
		}

		$data['additional_contacts'] = array();
		
		foreach ($results as $result) {
		
			if (is_file(DIR_IMAGE . $result['image'])) {
				$image = $result['image'];
				$thumb = $result['image'];
			} else {
				$image = '';
				$thumb = 'no_image.png';
			}
		
			$data['additional_contacts'][] = array(
				'image' => $image,
				'thumb' => $this->model_tool_image->resize($thumb, 60, 60),
				'link' => $result['link'],
				'title' => $result['title'],
				'sort'  => $result['sort']
			);	
		} 
		
		
		// instaled modules
		
		if (isset($this->request->post['new_home_layout_module'])) {
			$data['new_home_layout_modules'] = $this->request->post['new_home_layout_module'];
		} elseif ($this->config->get('new_home_layout_module')) {
			$data['new_home_layout_modules'] = $this->config->get('new_home_layout_module');
		} else {
			$data['new_home_layout_modules'] = array();
		}

		$this->load->model('extension/extension');

		$this->load->model('extension/module');

		$data['new_home_extensions'] = array();

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
				$data['new_home_extensions'][] = array(
					'name'   => $this->language->get('heading_title'),
					'code'   => $code,
					'module' => $module_data
				);
			}
		}
		
		
		
		if (isset($this->request->post['left_subcategory'])) {
			$data['left_subcategory'] = $this->request->post['left_subcategory'];
		} else {
			$data['left_subcategory'] = $this->config->get('left_subcategory');
		}
		
		if (isset($this->request->post['category_description_position'])) {
			$data['category_description_position'] = $this->request->post['category_description_position'];
		} else {
			$data['category_description_position'] = $this->config->get('category_description_position');
		}
		
		if (isset($this->request->post['product_short_description'])) {
			$data['product_short_description'] = $this->request->post['product_short_description'];
		} else {
			$data['product_short_description'] = $this->config->get('product_short_description');
		}
		
		if (isset($this->request->post['product_short_attributes'])) {
			$data['product_short_attributes'] = $this->request->post['product_short_attributes'];
		} else {
			$data['product_short_attributes'] = $this->config->get('product_short_attributes');
		}
		
		if (isset($this->request->post['product_social_likes'])) {
			$data['product_social_likes'] = $this->request->post['product_social_likes'];
		} else {
			$data['product_social_likes'] = $this->config->get('product_social_likes');
		}
		
		if (isset($this->request->post['related_product_position'])) {
			$data['related_product_position'] = $this->request->post['related_product_position'];
		} else {
			$data['related_product_position'] = $this->config->get('related_product_position');
		}
		
		
		if (isset($this->request->post['disable_cart_button'])) {
			$data['disable_cart_button'] = $this->request->post['disable_cart_button'];
		} else {
			$data['disable_cart_button'] = $this->config->get('disable_cart_button');
		}
		
		if (isset($this->request->post['disable_cart_button_text'])) {
			$data['disable_cart_button_text'] = $this->request->post['disable_cart_button_text'];
		} else {
			$data['disable_cart_button_text'] = $this->config->get('disable_cart_button_text');
		}
		
		if (isset($this->request->post['on_off_qview'])) {
			$data['on_off_qview'] = $this->request->post['on_off_qview'];
		} else {
			$data['on_off_qview'] = $this->config->get('on_off_qview');
		}
		
		if (isset($this->request->post['col_left_button_text'])) {
			$data['col_left_button_text'] = $this->request->post['col_left_button_text'];
		} else {
			$data['col_left_button_text'] = $this->config->get('col_left_button_text');
		}
		
		if (isset($this->request->post['col_right_button_text'])) {
			$data['col_right_button_text'] = $this->request->post['col_right_button_text'];
		} else {
			$data['col_right_button_text'] = $this->config->get('col_right_button_text');
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