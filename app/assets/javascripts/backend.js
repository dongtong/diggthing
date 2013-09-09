//= require jquery-min
//= require jquery-migrate-1.2.1
//= require jquery_ujs   
//= require bootstrap.min  
//= require gotoTop
//= require mustache
//= require wysihtml5-0.3.0.min
//= require bootstrap-wysihtml5
//= require prettify

$(function(){

	$(".backToTop").goToTop();
	$(window).bind('scroll resize',function(){
		$(".backToTop").goToTop({
			pageWidth:1040,
			duration:0
		});
	});

	// Scraped Cartoons
	$('#cartoon_res a.download_cartoon').click(function(e){
		e.preventDefault();
		var $this = $(this);
		$.ajax({
			type: 'POST',
			url: '/admin/cartoons/import',
			beforeSend: function(xhr) {
		        xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));
		    },
			data: "cartoon_tmp_id="+$(this).data('params').cartoon_tmp_id
		}).done(function(responseText, status, jqXHR){
			if(responseText.state === 'success'){
				 $this.parent().prev().html('<img alt="Right" class="icon right" src="/assets/right.png" title="right">')
			}else{
				alert("导入图片失败")
			}
		});
		return false;
	});

	$('#book_contents').wysihtml5({
	    "html": true,
	    "color": true
	});
})