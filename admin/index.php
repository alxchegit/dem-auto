<?php include("../template/head.php"); ?>
<!-- HEADER -->
	<header class="header">
		<div class="container">
			<div class="row">
				<h1 class="col-md-10 col-lg-10 col-sm-12">Интернет магазин</h1>
				<a class="col-md-2 col-lg-2" href="http://<?php echo $_SERVER['HTTP_HOST'] ?>" class="btn-right">Exit</a>
			</div>
		</div>
	</header> 
<!-- MAIN -->
	<div class="admin main-body XcontainerX">
		<h2 class="main-header text-center">Админка</h2>
		<p class="alert alert-info">Страница добавления/удаления товаров, а также их редактирования. На закладке "Редактирование" произведите поиск всех товаров. При нажатии на строке с необходимым товаром, откроется форма редактирования или удаления товара</p>
		 
		<ul class="nav nav-pills nav-justified ">
			<li class="nav-item">
				<a class="nav-link active" data-toggle="pill" href="#goods-add">Добавить</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" data-toggle="pill" href="#goods-edit">Редактировать</a>
			</li>
		 
		</ul>
 
	<div class="tab-content admin-content">
		<div class="tab-pane XcontainerX active" id="goods-add">
		<h3 class="text-center">Добавить</h3>
		<form class="goods-add-form" action="javascript:void(0);">
			<div class="form-group">
				<label for="name">Название</label>
				<input type="text" class="form-control" placeholder="Название товара" name="name" id="name">
			</div>
			<div class="form-group">
				<label for="description">Описание</label>
				<textarea class="form-control" id="description" rows="4" maxlength="1000" name="descr"></textarea>
			</div>
			<div class="form-group">
				<label for="price">Цена:</label>
				<input type="number" class="form-control" placeholder="Цена" id="price" name="price">
			</div>
			<div class="form-group">
				<label for="goods-m-title">Мета-тег Title:</label>
				<input type="text" class="form-control"  id="goods-m-title" name="meta_title">
			</div>
			<div class="form-group">
				<label for="goods-m-descr">Мета-тег Description:</label>
				<input type="text" class="form-control"  id="goods-m-descr" name="meta_descr">
			</div>
			<div class="form-group">
				<label for="price">Категории:</label>
				<select id="goods-to-categories" class="form-control" multiple >
					<?php 
						$cat = $mydb->getCategoriesAll();
						$do->showAllCategoriesForSelect(0, 0, $cat['data']);
					 ?>
				</select>
			</div>						
			<button class="btn btn-primary" id="goods-form__submit">Добавить</button>
		</form>

		</div> <!-- добавить -->
		<div class="tab-pane XcontainerX fade clearfix" id="goods-edit">
			<div class="tab-content">
				<div class="goods-edit start_table active tab-pane">
					<h3 class="text-center">Поиск</h3>
					<table>
						<thead>
						  <tr>                 
							<th style="display: none;">ID</th>
							<th>Название</th>
							<th>Категория</th>
							<th>Описание</th>
							<th>Цена</th>
							<th>Meta-title</th>
							<th>Meta-description</th>					  
			  				</tr>				   
						</thead>
						<tbody class="goods-edit__Tbody"></tbody>
					</table>
					<button type="button" class="btn float-right btn-primary" id="getGoods">Получить</button>
				</div>
	
				<div class="goods-edit form_div fade tab-pane">
					<h3 class="text-center">Редактирование</h3>
					<button type="button" class="btn btn-primary">Назад</button>
					<form class="goods-edit-form" action="javascript:void(0);">
						<div class="form-group">
							<label for="goods-edit-name">Название</label>
							<input type="text" class="form-control" placeholder="Название товара" name="name" id="goods-edit-name">
						</div>
						<div class="form-group">
							<label for="goods-edit-description">Описание</label>
							<textarea class="form-control" id="goods-edit-description" rows="4" maxlength="1000" name="descr"></textarea>
						</div>
						<div class="form-group">
							<label for="goods-edit-price">Цена:</label>
							<input type="number" class="form-control" placeholder="Цена" id="goods-edit-price" name="price">
						</div>
						<div class="form-group">
							<label for="goods-edit-m-title">Мета-тег Title:</label>
							<input type="text" class="form-control"  id="goods-edit-m-title" name="meta_title">
						</div>
						<div class="form-group">
							<label for="goods-edit-m-descr">Мета-тег Description:</label>
							<input type="text" class="form-control"  id="goods-edit-m-descr" name="meta_descr">
						</div>
						<div class="form-group">
							<label for="goods-edit-to-categories">Категории:</label>
							<select id="goods-edit-to-categories" class="form-control" multiple >
								<?php 
									$do->showAllCategoriesForSelect(0, 0, $cat['data']);
								 ?>
							</select>
						</div>
						<div id="goods-edit-prod_id" style="display: none;"></div>
						<button class="btn btn-primary float-left" id="goods-edit-form__submit">Изменить</button>
						<button class="btn btn-danger float-right" id="goods-edit-form__delete">Удалить</button>
					</form>
				</div>
			</div> 
		</div><!-- Редактировать -->
		 
	</div> <!-- tab-content -->
			
	</div> <!-- main-body container -->

<?php include("../template/footer.php"); ?>