<?php

/**
 *  Работа с Базой Данных
 */
class MyDB
{
	private $link;
	private $clear = array('data' => array(), 'error' => array());

	public function connect($host,$username,$password,$database){
		$this->link = new mysqli($host,$username,$password,$database);
		if ($this->link->connect_error) {
      		trigger_error('error: Could not make a database link (' . $this->link->connect_errno . ') ' . $this->link->connect_error);
		}
	}

	public function myquery($query){
		if (!$result = $this->link->query($query)){
			return false;				
		}
		
		return $result;		
	}

/**
*
*	Получить список ВСЕХ категорий
*
*	@return 
*/
	public function getCategoriesAll() {
		$this->clearOutput($output);
		$sql = "SELECT * FROM `categories` WHERE `status` = '1'";

		$res = $this->myquery($sql);

		if(is_object($res)){
			if ($res->num_rows == 0) {
			$output['error'] = "no data";
			} else {
			while ($row = $res->fetch_assoc()){
				// array_push($output['data'], $row);
				$output['data'][$row['cat_parent']][] = $row;
				}
			}						
			$res->close();
		} else {
			$output['error'] = "res is not object";
			}
			return $output;

	}

/**
*
*	Получить категорию по ID
*
*/

	public function getCategoryByID($id) {
		$this->clearOutput($output);
		 
		$sql = "SELECT * FROM `categories` WHERE `status` = '1' AND `id` = $id";

		$res = $this->myquery($sql);

		if(is_object($res)){
			if ($res->num_rows == 0) {
			$output['error'] = "no data";
			} else {
			while ($row = $res->fetch_assoc()){
				$output['data'] = $row;
				}
			}						
			$res->close();
		} else {
			$output['error'] = "res is not object";
			}
			return $output;
	}


/**
*
*	Получить список верхних категорий
*
**/
public function getCategoryTop() {
		$this->clearOutput($output);
		$sql = "SELECT * FROM `categories` WHERE `status` = '1' AND `cat_parent` = '0'";

		$res = $this->myquery($sql);

		if(is_object($res)){
			if ($res->num_rows == 0) {
			$output['error'] = "no data";
			} else {
			while ($row = $res->fetch_assoc()){
				array_push($output['data'], $row);
				}
			}						
			$res->close();
		} else {
			$output['error'] = "res is not object";
			}
			return $output;
	}

/**
*
*	Получить список всех товаров
*
*/

public function getGoods(){
	$this->clearOutput($output);
	$sql = "SELECT * FROM `products` ";

	$res = $this->myquery($sql);
	if(is_object($res)){
		if ($res->num_rows == 0) {
		$output['error'] = "no data";
		} else {
		while ($row = $res->fetch_assoc()){			
			$row['categories'] = $this->getCategoryByProductID($row['id']);
			array_push($output['data'], $row);
			}

		}						
		$res->close();
	} else {
		$output['error'] = "res is not object";
		}
	return json_encode($output);

}

/**
*
*	Получить продукт по ID
*
*/

public function getSingleProduct($prod_id){
	$this->clearOutput($output);
	$sql = "SELECT * FROM `products` WHERE `id` = $prod_id";

	$res = $this->myquery($sql);

	if(is_object($res)){
		if ($res->num_rows == 0) {
		$output['error'] = "no data";
		} else {
		while ($row = $res->fetch_assoc()){
			$row['categories'] = $this->getCategoryByProductID($prod_id);
			array_push($output['data'], $row);
			}
		}
		$res->close();
	} else {
		$output['error'] = "res is not object";
		}
	return json_encode($output);

}

/**
*
*	Получить список товаров в категории
*
*/

public function getGoodsByCategoryID($cat_id){
	$this->clearOutput($output);
	$product_ids = array();
	$sql = "SELECT `prod_id` FROM `product_to_cat` WHERE `product_to_cat`.`cat_id` = $cat_id";

	$res = $this->myquery($sql);

	if(is_object($res)){
		if($res->num_rows == 0){
			$output['error'] = "no data";
		} else {
			while ($row = $res->fetch_assoc()) {
				array_push($product_ids, $row['prod_id']);
			}
		}
	}

	foreach ($product_ids as $prod_id) {
		$prod = $this->getSingleProduct($prod_id);
		$prod = json_decode($prod, true);
		array_push($output['data'], $prod['data'][0]);
	}
	return $output;
}

/**
*
*	Получить список категорий которым принадлежит товар
*
*/

public function getCategoryByProductID($prod_id){
	$this->clearOutput($output);
	$sql = "SELECT `categories`.`cat_name` FROM `products` JOIN `product_to_cat` ON `products`.`id` = `product_to_cat`.`prod_id` JOIN `categories` ON `product_to_cat`.`cat_id` = `categories`.`id` WHERE `products`.`id` = $prod_id";

	$res = $this->myquery($sql);

	if(is_object($res)){
		if ($res->num_rows == 0) {
		$output['error'] = "no data";
		} else {
		while ($row = $res->fetch_assoc()){
			// $output['data'] = $row;
			array_push($output['data'], $row['cat_name']);
			}
		}
		$res->close();
	} else {
		$output['error'] = "res is not object";
		}
	return $output['data'];
}

/**
*
*	Добавить товар
*
*/

public function addProduct($data = array()){
	
	$name = $this->escape($data['name']);
	$descr = $this->escape($data['descr']) ;
	$price = (float)$data['price'];
	$meta_title = $this->escape($data['meta_title']);
	$meta_descr = $this->escape($data['meta_descr']);
	$categories = json_decode( $data['categories']);

	$sql = "INSERT INTO `products`(`id`, `prod_name`, `prod_descr`, `prod_price`, `meta_title`, `meta_description`) VALUES (NULL,'$name', '$descr', '$price', '$meta_title', '$meta_descr')";

	$this->myquery($sql);

	$product_id = $this->getlastId();

	if (isset($categories)) {
		foreach ($categories as $category_id) {
			$this->myquery("INSERT INTO `product_to_cat` SET prod_id = '" . (int)$product_id . "', cat_id = '" . (int)$category_id . "'");
		}
	}
	return $product_id;
}

/**
*
* 	Изменить товар
*
*/

public function editProduct($data){
	$name = $this->escape($data['name']);
	$descr = $this->escape($data['descr']) ;
	$price = (float)$data['price'];
	$meta_title = $this->escape($data['meta_title']);
	$meta_descr = $this->escape($data['meta_descr']);
	$categories = json_decode( $data['categories']);
	$id 		= $data['id'];

	$sql = "UPDATE `products` SET `prod_name`= '$name', `prod_descr`= '$descr', `prod_price`='$price', `meta_title`='$meta_title',`meta_description`= '$meta_descr' WHERE `products`.`id` = " .(int)$id;

	$res = $this->myquery($sql);

	if(isset($categories)){
		$this->myquery("DELETE FROM `product_to_cat` WHERE `prod_id` = " . (int)$id);
		
		foreach ($categories as $category_id) {
			$this->myquery("INSERT INTO `product_to_cat` SET prod_id = '" . (int)$id . "', cat_id = '" . (int)$category_id . "'");
		}
	}

	if($res){
		return $this->getlastId();
	} else {
		return $this->link->error;
	}

}

/**
*
*	Удалить товар
*
*/

public function deleteProduct($prod_id){
	$this->myquery("DELETE FROM `products` WHERE `products`.`id` = " . (int)$prod_id);
	$this->myquery("DELETE FROM `product_to_cat` WHERE `prod_id` = " . (int)$prod_id);

	return $this->link->error;
}


//************************************************
	private function clearOutput(&$output = ""){
		$output = $this->clear;		
	}

	public function countAffected() {
    	return $this->link->affected_rows;
  	}

  	public function getLastId() {
    	return $this->link->insert_id;
  	}	

	public function escape($value) {
		return $this->link->real_escape_string($value);
	}
	
	public function __destruct() {
		if($this->link){
			$this->link->close();

		}
	}
} //class
