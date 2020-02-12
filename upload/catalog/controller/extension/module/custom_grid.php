<?php
class ControllerExtensionModuleCustomGrid extends Controller {
	public function index($setting) {
		static $module = 0;

		$this->load->model('design/banner');
		$this->load->model('tool/image');

		$data['banners'] = array();

		$results = $this->model_design_banner->getBanner($setting['banner_id']);
		
		//$this->log->debug($results);

		foreach ($results as $result) {
			if (is_file(DIR_IMAGE . $result['image'])) {
				$data['banners'][] = array(
					'title' => $result['title'],
					'link'  => $result['link'],
					//'image' => $this->model_tool_image->resize($result['image'], 500, 500)
					'image' => HTTP_SERVER . 'image/' . $result['image']
				);
			}
		}
		
		$data['columns'] = $setting['columns'];

		$data['module'] = $module++;

		return $this->load->view('extension/module/custom_grid', $data);
	}
}
