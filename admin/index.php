<?php include("../template/head.php"); ?>
<!-- <?php foreach ($_SERVER as $parm => $value)  echo "$parm = '$value'<br>"; ?> -->
	<header class="header">
		<div class="container">
			<div class="row">
				<h1 class="col-md-6 col-lg-10 col-sm-12">Интернет магазин</h1>
				<a class="col-md-6 col-lg-2" href="http://<?php echo $_SERVER['HTTP_HOST'] ?>" class="btn-right">Exit</a>
			</div>
		</div>
	</header> 

	<div class="main-body container">
		<h2 class="main-body__title">Админка</h2>
		<br>
		<p>Страница добавления/удаления товаров, а также их редактирования.</p>
		 
	<ul class="nav nav-pills">
	<li class="nav-item">
		<a class="nav-link active" data-toggle="pill" href="#goods-add">Добавить</a>
	</li>
	<li class="nav-item">
		<a class="nav-link" data-toggle="pill" href="#goods-edit">Редактировать</a>
	</li>
	 
	</ul>
 
	<div class="tab-content">
		<div class="tab-pane container active" id="goods-add">
		<h3>Добавить</h3>
		<form class="goods-add-form" action="javascript:void(0);">
			<div class="form-group">
				<label for="name">Название</label>
				<input type="text" class="form-control" placeholder="Название товара" id="name">
			</div>
			<div class="form-group">
				<label for="description">Описание</label>
				<textarea class="form-control" id="description" rows="4" maxlength="1000"></textarea>
			</div>
			<div class="form-group">
				<label for="price">Цена:</label>
				<input type="number" class="form-control" placeholder="Цена" id="price">
			</div>
			<div class="form-group">
				<label for="goods-m-title">Мета-тег Title:</label>
				<input type="text" class="form-control"  id="goods-m-title">
			</div>
			<div class="form-group">
				<label for="goods-m-descr">Мета-тег Description:</label>
				<input type="text" class="form-control"  id="goods-m-descr">
			</div>
			<div class="form-group">
				<label for="price">Категории:</label>
				<select id="goods-to-categories" multiple>
					<?php 
						$cat = $mydb->getCategoriesAll();
						// test($cat['data']);
						showAllCategoriesForSelect(0, 0, $cat['data']);
					 ?>
				</select>
			</div>						
				<button class="btn btn-primary" id="goods-form__submit">Добавить</button>
			</form>

		</div> <!-- добавить -->
		<div class="tab-pane container fade" id="goods-edit">
			Редактировать

		</div> <!-- Редактировать -->
		 
	</div> <!-- tab-content -->
			
	</div> <!-- main-body container -->

<?php include("../template/footer.php"); ?>