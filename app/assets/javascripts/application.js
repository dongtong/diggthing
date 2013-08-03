//= require jquery-min
//= require jquery_ujs   
//= require bootstrap.min
//= require admin/backend                
$(function(){
	$('.bs-docs-carousel-example').carousel();

	$('button.import').click(function(e){
		e.preventDefault();
		var cartoon_record = $(this).parent().parent();
		$.ajax({
			type: 'POST',
			url: '/admin/cartoons/import',
			beforeSend: function(xhr) {
		        xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));
		    },
			data: "cartoon_tmp_id="+cartoon_record.find('.cartoon_tmp_id').val()
		}).done(function(responseText, status, jqXHR){
			cartoon_record.html(responseText)
		});
		return false;
	})
});

