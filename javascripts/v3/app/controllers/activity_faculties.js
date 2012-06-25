$.Class("ccpd.activity_faculties",{
	init:function(params) {
	},
	attendees: [],
	currFaculty: 0,
	currPerson: 0,
	selectedCount: 0,
	selectedRows: '',
	updateFaculty: function() {
		var $loader = $(".js-faculty-loading");
		var $container = $(".js-faculty-container");
		var $fileUploader = $('.js-file-uploader');
		var $photoUploader = $('.js-photo-uploader');
		
		$loader.show();
		
		$.ajax({
			url: "/activity_faculties/ahah/" + nActivity,
			type: 'post',
			success: function(data) {
				$container.html(data);
				$loader.hide();
				
				// CHECK IF ATTENDEE HAS BEEN MARKED AS SELECTED	
				$('.js-all-faculty').unbind();
				
				$(".js-all-faculty").each(function() {
					console.log(this);
				});
			}
		});
	}
}, {});

(function(){
	
})();
