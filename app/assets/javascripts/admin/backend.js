$(function(){
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
})