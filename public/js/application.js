$(document).ready(function() {
	// Este código corre despues de que `document` fue cargado(loaded) 
	// completamente. 
	// Esto garantiza que si amarramos(bind) una función a un elemento 
	// de HTML este exista ya en la página.

	$("form").on("submit", function( event ) {
		event.preventDefault();
		console.log("Ya tengo control");

		var url = $("form").attr("action");

		var post = $.post(url, function(data) {
			$("#die").html(data);
		});
	});
});
