<?php 

/**
 *  
 */
class Doing 
{
	private $db_connection;

	public function __construct($mydb){
		if($mydb){
			$this->db_connection = $mydb;
		} 

		return false;
	} 
	 public function outCatTree($parent_id, $level, $category_arr) {
		  if (isset($category_arr[$parent_id])) {
				 echo "<ul  style='margin-top:" . ($level * 0) . "px;' class='nav navbar level-".$level."' data-level='".$level."'>";
				foreach ($category_arr[$parent_id] as $value) {  
					
					 echo "<li><a href=\"/?id=". $value['id'] ."&cat=".$value['cat_url']."\">".$value['cat_name']."</a>";
					 $level++;  
					 $this->outCatTree($value['id'], $level, $category_arr);
					 $level--; 

					 echo "</li>";
				}
				echo "</ul>";
		  } 
	 }

	 public function showAllCategoriesForSelect($parent_id, $level, $category_arr){
		  if (isset($category_arr[$parent_id])){
				foreach ($category_arr[$parent_id] as $value) {
					 echo "<option value='".$value['id']."' style='margin-left:".($level * 4)."px;' class='level-".$level."'>".$value['cat_name']."</option>";
					 $level++;
					 $this->showAllCategoriesForSelect($value['id'], $level, $category_arr);
					 $level--;
				}
		  }
	 }

	 public function showProducts($cat_id){
		  $products = $this->db_connection->getGoodsByCategoryID($cat_id);
		  $html = "";

		  foreach ($products['data'] as $product) {
			$html .= "<li class='goods-list__item'>";
			$html .= "<a class='goods-item__link' href='card.php?prod=".$product['id']."'>";
			$html .= "<article class='goods-item'>";
			$html .= "<div class='goods-item__img'>";
			$html .= "<img src='http://".$_SERVER['HTTP_HOST']."/img/goods.png' >";
			$html .= "</div>";                            
			$html .= "<h3 class='goods-item__header'>".$product['prod_name']."</h3>";
			$html .= "<p class='goods-item__description'>".$product['prod_descr']."</p>";
			$html .= "<p class='goods-item__price'>";
			$html .= "<span class='goods-item__price-value'>".$product['prod_price']."</span>";
			$html .= "<span class='goods-item__currency'> ₽</span></p>";
			$html .= "</article></a></li>";			
		  }

		  echo $html;
	 }

/**
*
*	Настройка SEO мета-тега Title
*
*/
	public function metaTitle($prod, $id){
		$meta_title = "Интернет магазин такойто, супер товары по низким ценам!";
		if($prod){
			$product =  json_decode($this->db_connection->getSingleProduct($prod), true);
			$meta_title = $product['data'][0]['meta_title'];

			if($meta_title === ""){
				$meta_title = $product['data'][0]['prod_name'] . "в интернет магазине Такомто по низким ценам!";
			}
		}

		if($id){
			$category = $this->db_connection->getCategoryByID($id);
			$meta_title = $category['data']['meta_title'];

		
			if($meta_title == ""){
				$meta_title = $category['data']['cat_name'] . " в интернет магазине Такомто по низким ценам!";
			}
		}

		// printf("Супер %s по низкой цене, купить в Москве|Интернет магазин такойто", $meta);
		echo $meta_title;
	}

/**
*
*	Настройка SEO мета-тега Description
*
*/
	public function metaDescription($prod, $id){
		$meta_descr = "В Интернет магазине такомто, можно приобрести супер товары по низким ценам! МЕБЕЛь и ТелеФОны, КухНя и ТелЕвизоРЫ";
		if($prod){
			$product =  json_decode($this->db_connection->getSingleProduct($prod), true);
			$meta_descr = $product['data'][0]['meta_description'];

			if($meta_descr === ""){ // если пустая ячейка в таблице
				$meta_descr = $product['data'][0]['prod_name'] . "в интернет магазине Такомто по низким ценам! Можно приобрести супер товары по низким ценам! МЕБЕЛь и ТелеФОны, КухНя и ТелЕвизоРЫ";
			}
		}

		if($id){
			$category = $this->db_connection->getCategoryByID($id);
			$meta_descr = $category['data']['meta_descr'];

			if($meta_descr === ""){
				$meta_descr = $category['data']['cat_name'] . " в интернет магазине Такомто по низким ценам! МЕБЕЛь и ТелеФОны, КухНя и ТелЕвизоРЫ";
			}
		}

		echo $meta_descr;
	}
}
