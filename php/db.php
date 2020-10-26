<?php

$DB_HOSTNAME = "localhost";
$DB_USERNAME = 'admin';
$DB_PASSWORD = 'root';
$DB_DATABASE = 'dem-auto';

/**
 * 
 */
class MyDB
{
	
	private $link;
	private $clear = array('data' => array(), 'error' => array());

	public function __construct($host,$username,$password,$database){
		$this->link = new mysqli($host,$username,$password,$database);
		if ($this->link->connect_error) {
      		trigger_error('error: Could not make a database link (' . $this->link->connect_errno . ') ' . $this->link->connect_error);
		}
	}
	
	public function myquery($query){
		if (!$result = $this->link->query($query)) 
			{
				return false;
				// return "error with database: (" . $this->link->errno . ") " . $this->link->error;
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
		$sql = "SELECT `id`, `cat_name`, `cat_url`, `cat_parent`, `cat_child` FROM `categories` WHERE `status` = '1'";

		if($res = $this->myquery($sql)){

		}
	}

/**
*
*	Получить категорию по ID
*
*/

	public function getCategoryByID($id) {
		$this->clearOutput($output);
		$sql = '';
		$sql = "SELECT `cat_name`, `cat_descr`, `cat_url`, `cat_child` FROM `categories` WHERE `status` = '1' AND `id` = $id";

		$res = $this->myquery($sql);

		if(is_object($res)){
			if ($res->num_rows == 0) {
			$output['error'] = "no data";
			} else {
			while ($row = $res->fetch_assoc()){
				$output['data'] = $row;
				}
			}						
		} else {
			$output['error'] = "res is not object";
			}
			$res->close();
			return $output;
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
		$this->link->close();
	}
} //class


$mydb = new MyDB($DB_HOSTNAME,$DB_USERNAME,$DB_PASSWORD,$DB_DATABASE);