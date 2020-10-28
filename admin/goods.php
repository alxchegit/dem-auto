<?php 

	include_once("../php/db.php");
	$data = array();
	$action = isset($_GET['action']) ? $_GET['action'] : false;
	$data['name'] = isset($_GET['name']) ? $_GET['name'] : "";
	$data['descr'] = isset($_GET['descr']) ? $_GET['descr'] : "";
	$data['price'] = isset($_GET['price']) ? $_GET['price'] : "";
	$data['meta_title'] = isset($_GET['meta_title']) ? $_GET['meta_title'] : "";
	$data['meta_descr'] = isset($_GET['meta_descr']) ? $_GET['meta_descr'] : "";
	$data['categories'] = isset($_GET['categories']) ? $_GET['categories'] : array();

	
	switch ($action) {
		case 'add':
			$goods_prod_id = $mydb->addProduct($data);

			echo $goods_prod_id;
			break;
		case 'getgoods':
			$goods_data = $mydb->getGoods();
			echo $goods_data;
			break;
		default:
			# code...
			break;
	}