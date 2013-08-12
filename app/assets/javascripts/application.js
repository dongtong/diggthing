//= require jquery-min
//= require jquery-migrate-1.2.1
//= require jquery_ujs   
//= require bootstrap.min
//= require admin/backend   
//= require gotoTop             
$(function(){
	// $('<a href="javascript:;" class="backToTop" title="返回顶部">返回顶部</a>').appendTo("body");

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
	});

	$(".backToTop").goToTop();
	$(window).bind('scroll resize',function(){
		$(".backToTop").goToTop({
			pageWidth:1040,
			duration:0
		});
	});
	
});

