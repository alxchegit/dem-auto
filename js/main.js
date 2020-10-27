$("#goods-form__submit").on("click", function(){
	let name = $(".goods-add-form #name").val();
	let price = $(".goods-add-form #price").val();
	let descr = $(".goods-add-form #description").val();
	let categories = $("#goods-to-categories").val();
	let meta_title = $("#goods-m-title").val();
	let meta_descr = $("#goods-m-descr").val();

	console.log(name);
	console.log(price);
	console.log(descr);
	console.log(categories);

	$.ajax({
		url: "goods.php?action=add&name="+name+"&descr="+descr+"&price="+price+"&meta_title="+meta_title+"&meta_descr="+meta_descr,
		succes: function(data){
			console.log(data)
		},
		error: function (jqXHR, exception) {
			console.log(ajax_error(jqXHR, exception));
		},
	})
})



function ajax_error(jqXHR, exception){
	var msg = '';
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
