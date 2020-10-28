$("#goods-form__submit").on("click", function(){
	
	let categories = $("#goods-to-categories").val();
	
	categories = JSON.stringify(categories);
	
	let data_url = $( ".goods-add-form" ).serialize();
		data_url += "&categories="+categories; 
	console.log(data_url);
		
	$.ajax({
		url: "goods.php?action=add&" + data_url,
		success: function(data){
			alert("Товар успешно добавлен! Товар занесен в базу, id=" + data);
			location.reload(); 
		},
		error: function (jqXHR, exception) {
			alert(ajax_error(jqXHR, exception));
			console.log(ajax_error(jqXHR, exception));
		},
	})
})

$("#getGoods").on("click", function(){
	let div = $(".goods-edit__Tbody");
		div.html("<tr><td colspan='6' ><div class='spinner-border text-primary' ></td></tr></div>");
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
});

$("#description").on("focusin", function(){
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
	let start_table_div = $(".goods-edit.start_table");
	let goods_edit_div = $(".goods-edit.form_div");
	let td_row = $(this).html();
	// let id = td_row.find(".id").html();
	
	$(".product_edit").html(td_row);

	start_table_div.toggleClass('active').toggleClass('fade');
	goods_edit_div.toggleClass('active').toggleClass('fade').toggleClass("show");		
	
});

$(".form_div>button").on("click", function(){
	$(".goods-edit.start_table").toggleClass('active').toggleClass('fade');
	$(".goods-edit.form_div").toggleClass('active').toggleClass('fade').toggleClass("show");
});

//FUNCTIONS  FUNCTIONS  FUNCTIONS  FUNCTIONS  FUNCTIONS  FUNCTIONS  FUNCTIONS  FUNCTIONS  FUNCTIONS  FUNCTIONS  FUNCTIONS  //
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
		html += "<td>" +elem['id']+ "</td>";
		html += "<td>" +elem['prod_name']+ "</td>";
		html += "<td>" +elem['categories']+ "</td>";
		html += "<td><div class='descriptions'>"+ elem['prod_descr'] + "</div></td>";
		html += "<td>" +elem['prod_price']+ "</td>";
		html += "<td>" +elem['meta_title']+ "</td>";
		html += "<td>" +elem['meta_description']+ "</td>";	
		html += "</tr>";
	});
	return html;

};