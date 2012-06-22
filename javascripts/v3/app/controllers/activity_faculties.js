$.Class("ccpd.activity_faculties",{
	init:function(params) {
	},
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
					var $row = $(this);
					var $checkBox = $row.find('.js-selected-checkbox');
					var $fileApprover = $row.find('.js-approve-file-link');
					var $fileUploadLink = $row.find('.js-upload-file');
					var $photo = $row.find('.js-person-photo');
					var nPerson = $row.find('.personId').val();
					var nFaculty = $row.find('.facultyId').val();
					
					// DETERMINE IF CURRENT ROW NEEDS CHECKED
					if($.ListFind(selectedRows, nFaculty)) {
						$row.addClass('alert alert-info');
						$checkBox.attr('checked', true);
					}
					
					$checkBox.click(function() {
						if($(this).attr("checked")) {
							$row.addClass('alert alert-info');
							
							// ADD CURRENT MEMBER TO SELECTEDROWS LIST
							addSelectedRow({
								person:nPerson,
								faculty:nFaculty
							});
						} else {
							$row.removeClass('alert alert-info');
							
							// REMOVE CURRENT MEMBER FROM SELECTEDROWS LIST
							removeSelectedRow({
								person:nPerson,
								faculty:nFaculty
							});
						}
					});
			
					$fileApprover.live('click', function() {
						var idSplit = this.id.split('|');
						var sApprovalType = idSplit[0];
						var sFileType = idSplit[1];
						
						$.ajax({
							url: "/AJAX_adm_Activity/approveFacultyFile", 
							type: 'post',
							data: { facultyId: nFaculty, FileType: sFileType, Mode: sApprovalType },
							success: function(data) {			
								if(data.STATUS) {
									updateFaculty();
									addMessage(data.STATUSMSG,250,6000,4000);
								} else {
									updateFaculty();
									addError(data.STATUSMSG,250,6000,4000);
								}
							}
						});
					});
		
					$fileUploader.dialog({ 
						title:"Upload File",
						modal: false, 
						autoOpen: false,
						height:246,
						width:350,
						resizable: false,
						stack: false,
						buttons: { 
							Save:function() {
								$("#frmFileUpload").ajaxSubmit({
									dataType: 'json',
									forceSync: true,
									success: function(data) {
										
										$fileUploader.html('');
										addMessage('File uploaded successfully.',500,6000,4000);
										$fileUploader.dialog('close');
									}
								}); 
							},
							Cancel:function() {
								$fileUploader.dialog('close');
								updateFaculty();
							}
						},
						open:function() {
							$.ajax({
								url: '/files/new/' + nPerson,
								type: 'post',
								data: { keyType: 'person', activityId: nActivity, facultyId: nFaculty }, 
								success: function(data) {
									$fileUploader.html(data);
								}
							});
						},
						close:function() {
							updateFaculty();
							updateActions();
						}
					});
		
					$fileUploadLink.live('click', function() {
						$fileUploader.dialog('open');
					});
		
					$photo.live('click', function() {
						$("#frmUpload").attr("src", '/people/photoupload/' + nPerson + '?ElementID=' + this.id);
						$photoUploader.dialog("open");
					});
					
					$photoUploader.dialog({ 
						title:"Upload Photo",
						modal: false, 
						autoOpen: false,
						height:120,
						width:450,
						resizable: false,
						open:function() {
							$photoUploader.show();
						}
					});
				});
			}
		});
	}
}, {});

(function(){
	
})();
