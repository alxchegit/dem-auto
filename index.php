<?php include("template/head.php"); ?>

<?php $cat = isset($_GET['cat']) ? $_GET['cat'] : false; ?>
<?php $id = isset($_GET['id']) ? $_GET['id'] : false; ?>
<?php 
	if($id){
		$category = $mydb->getCategoryByID($id); 		
	} ?>

	<header>
		<h1>Интернет магазин</h1>
		<a href="http://<?php echo $_SERVER['HTTP_HOST'] ?>/admin/" class="btn-right">Админка</a>
	</header>

	<div class="left-sidebar">
		<ul>
	<?php 
		$top_cat = $mydb->getCategoryTop();	
		$data = $top_cat['data'];	
		foreach ($data as $categories) { ?>
			<li><a href="/?id=<?php echo $categories['id'];?>&cat=<?php echo $categories['cat_url'];?>"><?php echo $categories['cat_name']; ?></a></li>
	<?php } ?>
		</ul>
	</div>

	<div class="main-body"></div>
	<main>
	<div class="container">
		<h2 class="main-header"><?php echo $category['data']['cat_name']; ?></h2>
		<div class="goods wrapper">
			<ul class="goods-list">

				<li class="goods-list__item">
					<a class="goods-item__link" href="card.html#idd001">
						<article class="goods-item">
							<div class="goods-item__img">
								<img src="https://www.ikea.com/ru/ru/images/products/fabler-byorn-myagkaya-igrushka-bezhevyy__0710165_PE727396_S5.JPG" data-second-image="https://www.ikea.com/ru/ru/images/products/fabler-byorn-myagkaya-igrushka-bezhevyy__0876876_PE611263_S5.JPG" alt="ФАБЛЕР БЬЁРН">
							</div>
							<p class="goods-item__new">Новинка</p>
							<h3 class="goods-item__header">ФАБЛЕР БЬЁРН</h3>
							<p class="goods-item__description">Мягкая игрушка, бежевый, 21 см</p>
							<p class="goods-item__price">
								<span class="goods-item__price-value">99</span>
								<span class="goods-item__currency"> ₽</span>
							</p>
							<button class="btn btn-add-card" aria-label="Добравить в корзину" data-idd="idd001"></button>
						</article>
					</a>
				</li>
				

			</ul>
		</div>
	</div>
</main>
	<footer></footer>

<?php include("template/footer.php"); ?>