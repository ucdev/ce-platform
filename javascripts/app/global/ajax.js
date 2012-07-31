ce.pkg("global.ajax",function(self,ce,Backbone,Marionette,$,_){
	$(function() {
		$(document).on("click", ".projectBar .nav-list a", function(){ ce.log.info("subnav clicked") });  
		$(document).on("click", ".pjaxLinks a", function(ev){ ce.log.info("topnav clicked"); ev.preventDefault(); });  
		
		$(".navbar .nav li a").pjax({
			container:"#page"
		});
		
		$(".projectBar .nav-list a").pjax({
			container:".contentBar"
		});
		
		$(document)
		  .on('ajax:success', function() { ce.log.info("ajax:success"); })
		  .on('pjax:success',   function() { ce.log.info("pjax:success"); })
		
		$(".contentBar").live("pjax:start",function(ev) {
			
		});
		
		$(".contentBar").on("pjax:end",function(ev) {
			var $el = $(ev.relatedTarget.parentElement);
			var $parent = $el.parent();
			var $grandparent = $parent.parent();
			
			$(".projectBar .nav-list li").removeClass('active').removeClass("open");
			$el.addClass('active');
			
			if($parent.hasClass('subnav')) {
				$grandparent.addClass("open");
			}
			
			$el.addClass("open");
			
			if($el.has('.subnav')) {
				$parent.addClass("open");	
			}
			
		});
		
		$.bind("ajax:success", function(xhr, data, status) {
			ce.log.dir(data);
		});
   });
});