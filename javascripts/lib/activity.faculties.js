var CurrPersonID = 0;

function saveFacultyMember() {
	$.blockUI({ message: '<h1>Adding Faculty Member...</h1>'});
	$.post(sRootPath + "/_com/AJAX_Activity.cfc", { method: "saveFacultyMember", PersonID: $("#FacultyID").val(), ActivityID: nActivity, returnFormat: "plain" },
		function(returnData) {
			cleanData = $.trim(returnData);
			status = $.ListGetAt(cleanData,1,"|");
			statusMsg = $.ListGetAt(cleanData,2,"|");

			if(status == 'Success') {
				updateFaculty();
				updateActions();
				addMessage(statusMsg,250,6000,4000);
				$.unblockUI();
			} else if(status == 'Fail') {
				addError(statusMsg,250,6000,4000);
				$.unblockUI();
				$("#FacultyName").val("Click Here to Search");
			}
		});
	
	$("#PersonActivityID").val('');
	$("#PersonActivityName").val('Click Here To Search');
}

function updateFaculty() {
	var $loader = $(".js-faculty-loading");
	var $container = $(".js-faculty-container");
	
	$loader.show();
	$.ajax({
		url: "/activity_faculties/ahah/" + nActivity,
		type: 'post',
		data: { ActivityID: nActivity },
		success: function(data) {
			$container.html(data);
			$loader.hide();
		}
	});
};

$(document).ready(function() {
	var $facultyRemover = $('.js-remove-faculty');
	
	// AHAH DATA LOAD
	updateFaculty();
	
	$facultyRemover.bind("click",function() {
		if(confirm("Are you sure you want to remove the checked people from this Activity?")) {
			var result = "";
			var cleanData = "";
			$(".MemberCheckbox:checked").each(function () {
				result = $.ListAppend(result,$(this).val(),",");
			});
			
			$.blockUI({ message: '<h1>Removing Selected Faculty Members...</h1>'});
			$.getJSON(sRootPath + "/_com/AJAX_Activity.cfc", { method: "removeCheckedFaculty", PersonList: result, ActivityID: nActivity, returnFormat: "plain" },
			function(data) {
				if(data.STATUS) {
					addMessage(data.STATUSMSG,250,6000,4000);
				} else {
					addError(data.STATUSMSG,250,6000,4000);
				}
				
				updateFaculty();
				updateActions();
				$.unblockUI();	
			});
		}
	});
	
	/* NOTES DIALOG */
	$("#FileUploader").dialog({ 
		title:"Upload File",
		modal: false, 
		autoOpen: false,
		height:246,
		width:285,
		resizable: false,
		stack: false,
		buttons: { 
			Save:function() {
				$("#frmFileUpload").ajaxSubmit({
					beforeSubmit:  function() {		// pre-submit callback 
						$("#Section" + CurrPersonID).html("<img src=\"/admin/_images/ajax-loader.gif\"/><br />Please wait...");
					}, 
					url: sMyself + "File.Upload&Mode=Person&ModeID=" + CurrPersonID + "&ActivityID=" + nActivity + "&Submitted=1",
					type: "post",
					success: function() {			// post-submit callback 
						$("#FileUploader").html("");
						addMessage("File uploaded successfully.",250,6000,4000);
						$("#FileUploader").dialog("close");
					}
				}); 
			},
			Cancel:function() {
				$(this).dialog("close");
				updateFaculty();
			}
		},
		open:function() {
			$.post(sMyself + "File.Upload", { Mode: "Person", ModeID: CurrPersonID, ActivityID: nActivity }, function(data) {
				$("#FileUploader").html(data);
			});
		},
		close:function() {
			updateFaculty();
			updateActions();
		}
	});
	
	$(".UploadFile").click(function() {
		CurrPersonID = $.ListGetAt(this.id,2,'|');
		$("#FileUploader").dialog("open");
	});
	/* // END NOTES DIALOG */
	
	/* PHOTO UPLOAD DIALOG */
	$("#PhotoUpload").dialog({ 
		title:"Upload Photo",
		modal: false, 
		autoOpen: false,
		height:120,
		width:450,
		resizable: false,
		open:function() {
			$("#PhotoUpload").show();
		}
	});
	
	$("img.PersonPhoto").click(function() {
		var nPersonID = $.Replace(this.id,"Photo","","ALL");
		$("#frmUpload").attr("src",sMyself + "Person.PhotoUpload?PersonID=" + nPersonID + "&ElementID=" + this.id);
		$("#PhotoUpload").dialog("open");
	});
	/* // END PHOTO UPLOAD DIALOG */
		
	/* FACULTY FILE APPROVAL */
	$(".approveFile").click(function() {
		var sApprovalType = $.ListGetAt(this.id, 1, "|");
		var sFileType = $.ListGetAt(this.id, 2, "|");
		var nPersonID = $.ListGetAt(this.id, 3, "|");
		
		$.getJSON(sRootPath + "/_com/AJAX_Activity.cfc", { method: "approveFacultyFile", ActivityID: nActivity, PersonID: nPersonID, FileType: sFileType, Mode: sApprovalType, returnFormat: "plain" },
		function(data) {			
			if(data.STATUS) {
				updateFaculty();
				addMessage(data.STATUSMSG,250,6000,4000);
			} else {
				updateFaculty();
				addError(data.STATUSMSG,250,6000,4000);
			}
		});
	});
		
	$("#CheckAll").click(function() {
		if($("#CheckAll").attr("checked")) {
			$(".MemberCheckbox").each(function() {
				$(this).attr("checked",true);
				
				$(".AllFaculty").css("background-color","#FFD");
			});
		} else {
			$(".MemberCheckbox").each(function() {
				$(this).attr("checked",false);
				
				$(".AllFaculty").css("background-color","#FFF");
			});
		}
	}); 
	
	$(".MemberCheckbox").bind("click", this, function() {
		if($(this).attr("checked")) {
			var nPersonID = $.Replace(this.id,"Checked","","ALL");
			$("#PersonRow" + nPersonID).css("background-color","#FFD");
		} else {
			var nPersonID = $.Replace(this.id,"Checked","","ALL");
			$("#PersonRow" + nPersonID).css("background-color","#FFF");
		}
	});
});