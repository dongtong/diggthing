//= require jquery-min
//= require jquery-migrate-1.2.1
//= require jquery_ujs   
//= require bootstrap.min
//= require admin/backend   
//= require gotoTop
//= require mustache

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
    //Cartoon List
    if ($('#cartoon_list').length) {
    	$.getScript('/cartoons/check/list?nav='+$('#curr_nav').val())
    }
    //Cartoon detail
    //expire fragment cache dynamic show
    if($('.cartoon-original-pic').length > 0){
    	$.getScript('/cartoons/check/'+$('#cartoon_id').val().split('?')[0])
    }
    $('ul.pager li.disabled a').click(function(e){
    	e.preventDefault();
    	return false;
    });

	var comment_tmpl = '<div class="panel"><div class="comment-header"><h5>{{username}}说:</h5></div><div class="comment-body">{{content}}</div></div>';

	$('#cartoon_detail').delegate('#add_comment','click', function(e){
		e.preventDefault();
		var form = $(this).parent();
	    $.ajax({
	        url: form.attr('action'),
	        data: form.serialize(),
	        method: 'POST', 
	        dataType: 'json'
	    }).done(function(data, textStatus, jqXHR){
	       if (data.state === 'failed') {
	       	  alert(data.msg)
	       }else{
	         $('#comments_list').append(Mustache.render(comment_tmpl, data.msg));
	         $('#comment_content').val("");
	       }
	    }).fail(function(data, textStatus, jqXHR){
	       alert("添加评论失败!")
	    });
		return false
	});
	
});

