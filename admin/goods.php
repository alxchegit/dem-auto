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
	$data['id'] = isset($_GET['id']) ? $_GET['id'] : "1";

	
	switch ($action) {
		case 'add':
			$result = $mydb->addProduct($data);
			
			break;
		case 'getgoods':
			$result = $mydb->getGoods();
			 
			break;
		case 'getsingleproduct':
			$result = $mydb->getSingleProduct($data['id']);
			
			break;
		case 'edit':
			$result = $mydb->editProduct($data);
			
			break;
		case 'delete':
			$result = $mydb->deleteProduct($data['id']);
			
			break;
		default:
			# code...
			break;
	}

	echo $result;