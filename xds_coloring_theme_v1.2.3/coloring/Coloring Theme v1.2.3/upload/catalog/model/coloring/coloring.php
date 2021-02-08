<?php
class ModelColoringColoring extends Model {
	public function getXmodule($code, $name) {
	
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "module WHERE name = '" . $name . "' AND `code` = '" . $this->db->escape($code) . "'");
		
		if ($query->row) {
			return unserialize($query->row['setting']);
		} else {
			return array();	
		}
	}
	
	public function getXbanner($name) {
	
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "banner WHERE name = '" . $name . "'");
		
		if ($query->row) {
			return $query->row['banner_id'];
		} else {
			return '';	
		}
	}
}