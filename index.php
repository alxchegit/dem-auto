<?php include("template/head.php"); ?>

<?php 
	if($id){
		$category = $mydb->getCategoryByID($id); 		
	} ?>

<!-- HEADER -->
<header class="header">
	<div class="container">
		<div class="row">
			<h1 class="col-md-6 col-lg-10 col-sm-12"><a href="/">Интернет магазин</a></h1>
			<a class="col-md-6 col-lg-2" href="http://<?php echo $_SERVER['HTTP_HOST'] ?>/admin/" class="btn-right">Админка</a>
		</div>
	</div>
</header>

<!-- CATALOG -->
<div class="catalog">
	<div class="container">
		<?php  
			$category_arr = $mydb->getCategoriesAll();
			$cat_data = $category_arr['data'];						 
			$do->outCatTree(0, 0, $cat_data);					 
		?>			 
	</div>
</div>

<!-- MAIN BODY -->
<main>
	<div class="container">
		<h2 class="main-header text-center"><?php 
			if($category['data']['cat_name']) {
				echo $category['data']['cat_name']; 
			} else {
				echo "Витрина интернет магазина.Главная страница";
			}
		?></h2>
		<?php if($id) { ?>
			<div class="goods wrapper">
				<ul class="goods-list">				
					<?php $do->getProducts($id); ?>
				</ul>
			</div>
		<?php } else { ?>
		<aside class="offer">
            <a href="card.html#idd059">
                <picture>
                    <source srcset="img/b47e07ee97fd5f9bf030d258d462a945.webp" type="image/webp">
                    <img src="img/b47e07ee97fd5f9bf030d258d462a945.jpg" alt="СЛАТТУМ">
                </picture>
            </a>             
        </aside>

		<?php } ?>
	</div>
</main>
<!-- FOOTER -->
<footer></footer>

<?php include("template/footer.php"); ?>