<?php 


function outTree($parent_id, $level, $category_arr) {
        if (isset($category_arr[$parent_id])) {//Если категория с таким parent_id существует
            	echo "<ul  style='margin-top:" . ($level * 25) . "px;' class='nav navbar level-".$level."'>";
            foreach ($category_arr[$parent_id] as $value) { //Обходим ее
                /**
                 * Выводим категорию 
                 *  $level * 25 - отступ, $level - хранит текущий уровень вложености (0,1,2..)
                 */
               
                echo "<li>" . $value['cat_name'] . "</li>";
                $level++; //Увеличиваем уровень вложености
                //Рекурсивно вызываем этот же метод, но с новым $parent_id и $level
                outTree($value['id'], $level, $category_arr);
                $level--; //Уменьшаем уровень вложености
            }
            echo "</ul>";
        } 
    };

function test($data){
		var_dump($data);
}