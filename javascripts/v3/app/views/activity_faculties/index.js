$.Class("ccpd.activity_faculties",{
	setup:function(params) {
	},
	
	init:function(params) {
		this.activity = ccpd.tier2;
		
		this.updateFaculty();
	},
	
	activity: [],
	
	updateFaculty: function() {
		var faculties = this;
		
		$.ajax({
			url: '/activity_faculties/ahah/',
			data: { key: this.activity.nActivity },
			type: 'post',
			success: function(data) {
				faculties.container = $('.js-faculty-container');
				faculties.loader = $('.js-faculty-loading');
				faculties.fileUploader = $('.js-file-uploader');
				faculties.photoUploader = $('.js-photo-uploader');
				
				faculties.container.html(data);
				faculties.loader.hide();
				
				faculties.fileUploader.dialog({ 
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
									addMessage('File uploaded successfully.',500,6000,4000);
									faculties.fileUploader.dialog('close');
									
									faculties.updateFaculty();
								}
							}); 
						},
						Cancel:function() {
							faculties.fileUploader.dialog('close');
						}
					},
					open:function() {
					},
					close:function() {
						faculties.fileUploader.html('');
					}
				});
					
				faculties.photoUploader.dialog({ 
					title:"Upload Photo",
					modal: false, 
					autoOpen: false,
					height:120,
					width:450,
					resizable: false,
					open:function() {
						faculties.photoUploader.show();
					}
				});
				
				// CHECK IF ATTENDEE HAS BEEN MARKED AS SELECTED	
				$('.js-all-faculty').unbind();
				
				ccpd.tier3.rows = [];
				
				$.each($('.js-all-faculty'), function(i, item) {
					var facultyId = $(this).find('.facultyId').val();
					var facultyContainer;
					
					ccpd.tier3.rows[facultyId] = [];
					
					facultyContainer = ccpd.tier3.rows[facultyId];
					
					facultyContainer['name'] = $('.js-faculty-name a').text();
					facultyContainer['role'] = $('.js-role-name').text();
					
					facultyContainer = new ccpd.activity_faculties.faculty({
						$elem: $(this)
					});
				});
			}
		});
	}
}, {});

$.Class("ccpd.activity_faculties.faculty",{},{
	init:function(params) {
		var faculty = this;
		this.parent = ccpd.activity_faculties;
		
		faculty.row = $(params.$elem);
		
		faculty.defineFaculty();
		
		faculty.checkBox.click(function() {
			faculty.selectRow();
		});
		
		faculty.fileUploadLink.click(function() {
			var type = this.id.split('-')[2];
			
			faculty.uploadFile(type);
		});
		
		faculty.photo.click(function() {
			faculty.uploadPhoto();
		});
		
		faculty['cv'].fileApprove.click(function() {
			faculty.approveFile('cv');
		});
		
		faculty['cv'].fileUnapprove.click(function() {
			faculty.unapproveFile('cv');
		});
		
		faculty['disclosure'].fileApprove.click(function() {
			faculty.approveFile('disclosure');
		});
		
		faculty['disclosure'].fileUnapprove.click(function() {
			faculty.unapproveFile('disclosure');
		});
		
		ccpd.tier3.rows[this.id] = faculty;
	},
	
	addSelectedRow: function() {
		if(!$.ListFind(ccpd.tier3.selectedRows, this.id, ',')) {
			ccpd.tier3.selectedRows = $.ListAppend(ccpd.tier3.selectedRows, this.id, ',');
			
			this.updateSelectedCount(1);
		} 
	},
	
	approveFile: function(type) {
		var row = this;
		
		$.ajax({
			url: "/AJAX_adm_Activity/approveFacultyFile", 
			type: 'post',
			data: { facultyId: this.id, FileType: type, Mode: 'Approve' },
			dataType: 'json',
			success: function(data) {
				if(data.STATUS) {
					row[type].fileApprove
							.parent().hide()
							.next().show();
							
					row[type].dateLabel.addClass('label-success');
							
					addMessage(data.STATUSMSG,250,6000,4000);
				} else {
					addError(data.STATUSMSG,250,6000,4000);
				}
			}
		});
	},
	
	defineFaculty: function() {
		this.checkBox = this.row.find('.js-selected-checkbox');
		this.fileDownloadLink = this.row.find('.js-download-file');
		this.fileUploadLink = this.row.find('.js-upload-file');
		this.id = this.row.find('.facultyId').val();
		this.photo = this.row.find('.js-person-photo');
		this.personId = this.row.find('.personId').val();
		this['cv'] = this.row.find('.js-cv-section');
		this['cv'].dateLabel = this.cv.find('.js-date-label');
		this['cv'].fileApprove = this.cv.find('.js-approve-link');
		this['cv'].fileUnapprove = this.cv.find('.js-unapprove-link');
		this['disclosure'] = this.row.find('.js-disclosure-section');
		this['disclosure'].dateLabel = this.disclosure.find('.js-date-label');
		this['disclosure'].fileApprove = this.disclosure.find('.js-approve-link');
		this['disclosure'].fileUnapprove = this.disclosure.find('.js-unapprove-link');
	},
	
	removeSelectedRow: function() {
		ccpd.tier3.selectedRows = $.ListDeleteAt(ccpd.tier3.selectedRows, $.ListFind(ccpd.tier3.selectedRows, this.id));
		
		this.updateSelectedCount(-1);
	}, 
	
	selectRow: function() {
		if(this.checkBox.attr('checked')) {
			this.row.addClass('alert alert-info');
			
			// ADD CURRENT MEMBER TO SELECTEDROWS LIST
			this.addSelectedRow();
		} else {
			this.row.removeClass('alert alert-info');
			
			// REMOVE CURRENT MEMBER FROM SELECTEDROWS LIST
			this.removeSelectedRow();
		}
	},
	
	unapproveFile: function(type) {
		var row = this;
		
		$.ajax({
			url: "/AJAX_adm_Activity/approveFacultyFile", 
			type: 'post',
			data: { facultyId: this.id, FileType: type, Mode: 'Unapprove' },
			dataType: 'json',
			success: function(data) {
				if(data.STATUS) {
					row[type].fileUnapprove
							.parent().hide()
							.prev().show();
							
					row[type].dateLabel.removeClass('label-success');
					
					addMessage(data.STATUSMSG,250,6000,4000);
				} else {
					addError(data.STATUSMSG,250,6000,4000);
				}
			}
		});
	},
	
	updateSelectedCount: function(val) {
		ccpd.tier3.selectedCount += val;
		if(ccpd.tier3.selectedCount > 0) {
			$(".js-partic-actions .btn").removeClass('disabled');
		} else {
			$(".js-partic-actions .btn").addClass('disabled');
		}
		$(".js-label-status-selected").text(ccpd.tier3.selectedCount);
	},
	
	uploadFile: function(type) {
		var parent = this.parent;
		$.ajax({
			url: '/files/new/',
			type: 'post',
			data: { key: this.personId, keyType: 'person', activityId: ccpd.tier3.activity.nActivity, facultyId: this.id, fileType: type }, 
			success: function(data) {
				parent.fileUploader.html(data);
			}
		});
		
		this.parent.fileUploader.dialog('open');
	},
	
	uploadPhoto: function() {
		this.parent.photoUploader.find('iframe').attr("src", '/people/photoupload/' + this.personId + '?ElementID=' + this.photo.attr('id'));
		this.parent.photoUploader.dialog("open");
	}
}, {});


(function(){
	
})();