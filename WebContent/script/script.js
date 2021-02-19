/**
 * 
 */

$("#OuiNvClient").click(function(){
	
	if($(this).is(':checked')){
		$('input[name="nameCustomer"]').val("test");
		console.log('ok');
	}
	
})