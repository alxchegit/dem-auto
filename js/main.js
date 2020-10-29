$("#goods-form__submit").on("click", function(){
	
	goodsToDB("add", $(this));
})

$("#getGoods").on("click", getGoods);

$("#description, #goods-edit-description").on("focusin", function(){
	let div = $(this);
	if(div.html() === ""){
		$.ajax({
			url:"https://fish-text.ru/get?type=paragraph&number=1&format=json",
			success:function(data){
				let text = $.parseJSON(data)['text'];
				div.html(text);
			},
			error:function(){
				alert("Ошибка с fish-text.ru/api")
			}
		})
	}
	return true;
});

$(".goods-edit__Tbody").on("click", "tr", function(){
	let row = $(this);
	let td_row = row.find("td")[0];
	 
	switchEditTabs();
	// console.log(td_row.innerHTML)
	putGoodsToEditForm(td_row.innerHTML);	
});

$(".form_div>button").on("click", switchEditTabs);

$("#goods-edit-form__submit").on("click", function(){
	let prod_id = $("#goods-edit-prod_id").html();
	// console.log(prod_id);
	// return;
	goodsToDB("edit", $(this), prod_id );
});

$("#goods-edit-form__delete").on("click", deleteGoods);

//FUNCTIONS  FUNCTIONS  FUNCTIONS  FUNCTIONS  FUNCTIONS  FUNCTIONS  FUNCTIONS  FUNCTIONS  FUNCTIONS  FUNCTIONS  FUNCTIONS  //

function deleteGoods(){
	let prod_id = $("#goods-edit-prod_id").html();

	$.ajax({
		url:"goods.php?action=delete&id=" + prod_id,
		success:function(data){
			alert("Попытка удаление товара id=" + prod_id + "завершена!");
			alert("Сообщение базы - \"" + data +"\"");
			switchEditTabs();
			getGoods();
		},
	});
}

function goodsToDB(action, button, prod_id = 0, ){
	let form = button.closest("form");
	let categories = form.find("select").val();
	
	categories = JSON.stringify(categories);
	
	let data_url = form.serialize();
		data_url += "&categories="+categories; 
		data_url += "&id=" + prod_id;
	$.ajax({
		url: "goods.php?action="+action+"&" + data_url,
		success: function(data){

			alert("Товар успешно " + (action === "add" ? "добавлен" : "изменен") + "! Товар занесен в базу, id=" + data);
			location.reload();
		},
		error: function (jqXHR, exception) {
			alert(ajax_error(jqXHR, exception));
			console.log(ajax_error(jqXHR, exception));
		},
	})
};

function switchEditTabs(){
	$(".goods-edit.start_table").toggleClass('active').toggleClass('fade');
	$(".goods-edit.form_div").toggleClass('active').toggleClass('fade').toggleClass("show");
}

function getGoods(){
	let div = $(".goods-edit__Tbody");
		div.html("<tr><td colspan='7' ><div class='spinner-border text-primary' ></td></tr></div>");
	$.ajax({
		url:"goods.php?action=getgoods",
		success: function(data){

			div.html(putGoodsInTable(data));
			// console.log(putGoodsInTable(data));
		},
		error: function (jqXHR, exception) {
			alert(ajax_error(jqXHR, exception));
			console.log(ajax_error(jqXHR, exception));
		},
	})
}

function putGoodsToEditForm(prod_id){
	let name_inp = $("#goods-edit-name");
	let description_inp = $("#goods-edit-description");
	let price_inp = $("#goods-edit-price");
	let m_title_inp = $("#goods-edit-m-title");
	let m_descr_inp = $("#goods-edit-m-descr");
	let prod_id_inp = $("#goods-edit-prod_id");
	$.ajax({
		url:"goods.php?action=getsingleproduct&id=" + prod_id,
		success: function(data){
			let product = $.parseJSON(data)['data'][0];
			console.log(product);
			name_inp.val(product['prod_name']);
			description_inp.html(product['prod_descr']);
			price_inp.val(product['prod_price']);
			m_title_inp.val(product['meta_title']);
			m_descr_inp.val(product['meta_description']);
			prod_id_inp.html(product['id'])
			 
		},
		error: function (jqXHR, exception) {
			alert(ajax_error(jqXHR, exception));
			console.log(ajax_error(jqXHR, exception));
		},
	})
}

function ajax_error(jqXHR, exception){
	let msg = '';
	if (jqXHR.status == 404) {
		msg = 'Страница не найдена. [404]';
	} else if (jqXHR.status == 500) {
		msg = 'Ошибка сервера [500].';
	} else if (exception === 'parsererror') {
		msg = 'Requested JSON parse failed.';
	} else if (exception === 'timeout') {
		msg = 'Время вышло, данные не получены.';
	} else if (exception === 'abort') {
		msg = 'Запрос Ajax прерван.';
	} else {
		msg = 'Непредвиденная ошибка.\n' + jqXHR.responseText;
	}
	return msg;
}

function putGoodsInTable(data) {
	let goods = $.parseJSON(data)['data'];
	let error = $.parseJSON(data)['error'];

	let html = '';
	$.each(goods, function(indx, elem){
		html += "<tr>";
		html += "<td style='display:none;'>" +elem['id']+ "</td>";
		html += "<td>" +elem['prod_name']+ "</td>";
		html += "<td>" +categoriesOut(elem['categories'])+ "</td>";
		html += "<td><div class='descriptions'>"+ elem['prod_descr'] + "</div></td>";
		html += "<td class='price'>" +elem['prod_price']+ "</td>";
		html += "<td><div class='meat-title'>" +elem['meta_title']+ "</div</td>";
		html += "<td><div class='meta-description'>" +elem['meta_description']+ "</div></td>";	
		html += "</tr>";
	});
	return html;
};

function categoriesOut(cat_array){
	let html = "<ul class='categories_list'>";
	for(let i in cat_array){
		html += "<li>"+cat_array[i]+"</li>";
	}
	html += "</ul>";
	return html;
}