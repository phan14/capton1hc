<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class User extends MY_Controller {

    function __construct() {
        parent::__construct();
        $this->load->model('user_model');
        $this->load->model('order_model');
        $this->load->model('product_model');
         $this->load->model('comment_model');
        $this->load->model('transaction_model');
        $this->load->library('form_validation');
        $this->load->helper('form');
    }

    public function index() {
        $message_success = $this->session->flashdata('message_success');
        $this->data['message_success'] = $message_success;

        $message_fail = $this->session->flashdata('message_fail');
        $this->data['message_fail'] = $message_fail;

        $user = $this->user_model->get_list();
        $this->data['user'] = $user;

        $this->data['temp'] = 'admin/user/index.php';
        $this->load->view('admin/main', $this->data);
    }

    public function order() {
        $message_success = $this->session->flashdata('message_success');
        $this->data['message_success'] = $message_success;

        $message_fail = $this->session->flashdata('message_fail');
        $this->data['message_fail'] = $message_fail;



        $id = $this->uri->segment(4);
        $input['where'] = array('user_id' => $id);
        $order = $this->transaction_model->get_list($input);
        $this->data['order'] = $order;

        $user = $this->user_model->get_info($id);
        $this->data['user'] = $user;
        $this->data['temp'] = 'admin/user/order';
        $this->load->view('admin/main', $this->data);
    }

    public function detail() {
        $id = $this->uri->segment(4);
        $transaction = $this->transaction_model->get_info($id);
        $this->data['transaction'] = $transaction;

        $input = array();
        $input['where'] = array('transaction_id' => $transaction->id);
        $info = $this->order_model->get_list($input);

        $list_product = array();
        foreach ($info as $key => $value) {
            $this->db->select('product.id as id,product.name as name,image_link, order.qty as qty, order.amount as price, order.id as order_id');
            $this->db->join('order', 'order.product_id = product.id');
            $where = array();
            $where = array('product.id' => $value->product_id);
            $list_product[] = $this->product_model->get_info_rule($where);
        }
        $this->data['list_product'] = $list_product;
        $this->data['temp'] = 'admin/user/detail';
        $this->load->view('admin/main', $this->data);
    }

    // public function edit()
    // {
    // 	$id = $this->uri->segment(4);
    // 	$user = $this->user_model->get_info($id);
    // 	if (empty($user)) {
    // 		$this->session->set_flashdata('message_fail', 'Th??nh vi??n kh??ng t???n t???i');
    // 		redirect(user_url('user'));
    // 	}
    // 	$this->data['user'] = $user;
    // 	if ($this->input->post()) {
    // 		$this->form_validation->set_rules('name','Full name','required');
    // 		$this->form_validation->set_rules('email','T??n ????ng nh???p','valid_email|required');
    // 		$this->form_validation->set_rules('level','Ph??n quy???n','required');
    // 		$password = $this->input->post('password');
    // 		if ($password!='') {
    // 			$this->form_validation->set_rules('password','Password','required');
    // 			$this->form_validation->set_rules('re_password','Password nh???p l???i','matches[password]');
    // 		}			
    // 		if ($this->form_validation->run()) {				
    // 			$data = array();
    // 			$data = array(
    // 				'name' => $this->input->post('name'),
    // 				'email' => $this->input->post('email'),
    // 				'level' => $this->input->post('level'),
    // 				'created' => date('Y-m-d H:i:s')
    // 				);
    // 			if ($password!='') {
    // 				$data['password'] = md5($password);
    // 			}
    // 			if ($this->user_model->update($id,$data)) {
    // 				$this->session->set_flashdata('message_success', 'Thay ?????i danh m???c th??nh c??ng');
    // 			}else{
    // 				$this->session->set_flashdata('message_fail', 'Thay ?????i danh m???c th???t b???i');
    // 			}
    // 			redirect(user_url('user'));
    // 		}
    // 	}
    // 	$user = $this->user_model->get_list();
    // 	$this->data['user']= $user;
    // 	$this->data['temp']='user/user/edit';
    // 	$this->load->view('user/main',$this->data);
    // }
    public function accept() {
        $id = $this->uri->segment(4);
        $data = array();
        $data['status'] = '1';
        $this->transaction_model->update($id, $data);
        $this->session->set_flashdata('message_success', 'X??c nh???n ????n ?????t h??ng th??nh c??ng');

        $input = array();
        $input['where'] = array('transaction_id' => $id);
        $order = $this->order_model->get_list($input);

        foreach ($order as $value) {
            $product = $this->product_model->get_info($value->product_id);

            $data = array();
            $data['buyed'] = $product->buyed + 1;
            $this->product_model->update($product->id, $data);
        }

        redirect(admin_url('user'));
    }

    public function del() {
        $id = $this->uri->segment(4);


        $where = array();
        $where = array('id' => $id);
        if (!$this->user_model->check_exists($where)) {
            $this->session->set_flashdata('message_fail', 'user kh??ng t???n t???i');
            redirect(user_url('user'));
        } else {
            $input = array();
            $input['where'] = array('user_id' => $id);
            $com = $this->comment_model->get_list($input);
            if (sizeof($com) != 0) {
                foreach ($com as $a) {
                    $this->comment_model->delete($a->id);
                }
            }
        }
        if ($this->user_model->delete($id)) {
            $this->session->set_flashdata('message_success', 'Delete user th??nh c??ng');
        } else {
            $this->session->set_flashdata('message_fail', 'Delete user th???t b???i');
        }
        redirect(admin_url('user'));
    }

    public function deldetail() {
        $id = $this->uri->segment(4);
        $where = array();
        $where = array('id' => $id);
        if (!$this->order_model->check_exists($where)) {
            $this->session->set_flashdata('message_fail', 'Category kh??ng t???n t???i');
            redirect(admin_url('transaction'));
        }
        if ($this->order_model->delete($id)) {
            $this->session->set_flashdata('message_success', 'Delete th??nh c??ng');
        } else {
            $this->session->set_flashdata('message_fail', 'Delete th???t b???i');
        }
        redirect(admin_url('user'));
    }

}
