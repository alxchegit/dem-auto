<?php 


function outCatTree($parent_id, $level, $category_arr) {
        if (isset($category_arr[$parent_id])) {//Если категория с таким parent_id существует
            	echo "<ul  style='margin-top:" . ($level * 0) . "px;' class='nav navbar level-".$level."' data-level='".$level."'>";
            foreach ($category_arr[$parent_id] as $value) {  
               
                echo "<li><a href=\"/?id=". $value['id'] ."&cat=".$value['cat_url']."\">".$value['cat_name']."</a></li>";
                $level++;  
                outCatTree($value['id'], $level, $category_arr);
                $level--; 
            }
            echo "</ul>";
        } 
    };

function showAllCategoriesForSelect($parent_id, $level, $category_arr){
    if (isset($category_arr[$parent_id])){
        foreach ($category_arr[$parent_id] as $value) {
            echo "<option value='".$value['id']."' style='margin-left:".($level * 4)."px;' class='level-".$level."'>".$value['cat_name']."</option>";
            $level++;
            showAllCategoriesForSelect($value['id'], $level, $category_arr);
            $level--;
        }
    }
}

function test($data){
		var_dump($data);
}