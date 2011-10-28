//= require jquery
//= require jquery_ujs
//= require jquery.validate/jquery.validate.min
//= require store/checkout
//= require store/product
//= require store/cart
$(document).ready(function() {
	$('.type').hover(
		function() { 
			$(this).find("span").addClass("hover"); 
		},
		function() { 
			$(this).find("span").removeClass("hover"); 
		}
	);	
});