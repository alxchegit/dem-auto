<?php 


function outTree($parent_id, $level, $category_arr) {
        if (isset($category_arr[$parent_id])) {//Если категория с таким parent_id существует
            	echo "<ul  style='margin-top:" . ($level * 0) . "px;' class='nav navbar level-".$level."' data-level='".$level."'>";
            foreach ($category_arr[$parent_id] as $value) {  
               
                echo "<li><a href=\"/?id=". $value['id'] ."&cat=".$value['cat_url']."\">".$value['cat_name']."</a></li>";
                $level++;  
                outTree($value['id'], $level, $category_arr);
                $level--; 
            }
            echo "</ul>";
        } 
    };

function test($data){
		var_dump($data);
}