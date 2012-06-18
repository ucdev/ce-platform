
function continueCopy() {
	var sNewActivityTitle = $("#NewActivityTitle").val();
	var nNewActivityType = $("#NewActivityType").val();
	var nNewGrouping = $("#NewGrouping").val();
	var nCopyChoice = $(".CopyChoice:checked").val();
	var nError = 0;
	
	if(nNewActivityType == "" && nCopyChoice == 1) {
		addError("Please select an activity type.",250,6000,4000);
		nError = nError + 1;
	}
	
	if(sNewActivityTitle == "") {
		addError("Please enter an activity title.",250,6000,4000);
		nError = nError + 1;
	}
	
	if(nError > 0) {
		return false;
	}
	
	if(nNewGrouping == "") {
		nNewGrouping = 0;
	}
	
	$.getJSON(sRootPath + "/ajax_adm_activity/", 
		{ method: "CopyPaste", Mode: nCopyChoice, NewActivityTitle: sNewActivityTitle, NewActivityTypeID: nNewActivityType, NewGroupingID: nNewGrouping, ActivityID: nActivity, ReturnFormat:"plain" },
		function(data) {
			if(data.STATUS) {
				window.location = sMyself + 'Activity.Detail?ActivityID=' + data.DATASET[0].ACTIVITYID + '&Message=' + data.STATUSMSG;
			} else {
				addError(data.STATUSMSG,250,6000,4000);
			}
	});
}

function cancelCopy() {

}

function setCurrActivityType(nID) {
	$("#NewActivityType").val(nID);
	getGroupingList(nID);
}

function getGroupingList(nID) {
	$("#NewGrouping").removeOption("");
	$("#NewGrouping").removeOption(/./);
	
	$("#NewGrouping").ajaxAddOption(sRootPath + "/ajax_adm_activity/getgroupings", { method: "", ATID: nID, returnFormat: "plain" }, false,
		function(data) {
		
		if($("#NewGrouping").val() != "") {
			$("#NewGrouping").val(nGrouping);
			$("#NewGroupingSelect").show();
		} else {
			$("#NewGrouping").val(0);
			$("#NewGroupingSelect").hide();
		}
	});
}

function updateAll() {
	updateStats();
	//updateActions();
	updateContainers();
	updateActivityList();
}

function updateStats() {
	$.post(sMyself + "Activity.Stats", { ActivityID: nActivity }, 
		function(data) {
			$("#ActivityStats").html(data);
	});
}

function updateActions() {
	/*$.post(sMyself + "Activity.ActionsShort", { ActivityID: nActivity }, 
		function(data) {
			$("#LatestActions").html(data);
	});*/
}

function updateContainers() {
	$.post(sMyself + "Activity.Container", { ActivityID: nActivity }, 
		function(data) {
			$("#Containers").html(data);
	});
}

function updateActivityList() {
	$.post(sMyself + "Activity.ActivityList", { ActivityID: nActivity },
	  	function(data){
			$("#ActivityList").html(data);
	  });
}

function updateNoteCount() {
	$.post(sRootPath + "/ajax_adm_activity/getnotecount", { method: "", ActivityID: nActivity, returnFormat: "plain" }, 
		function(data){
			var nNoteCount =  $.ListGetAt($.Trim(data), 1, ".");
			
			$("#NoteCount").html("(" + nNoteCount + ")");
	});
}

/* ON DOM LOAD EVENTS */
$(document).ready(function() {
	//updateActions();
	updateContainers();
	updateStats();
	updateNoteCount();
	
	/* STATUS CHANGER */
	$("#StatusChanger").change(function() {
		var nStatus = $(this).val();
		
		if(nStatus == "") {
			addError("You must select a status.",250,6000,4000);
			return false;
		}
		
		$.post(sRootPath + "/ajax_adm_activity/updateactivitystatus", { method: "", ActivityID: nActivity, StatusID: nStatus, returnFormat:"plain" },
		  function(data){
			var cleanData = $.trim(data);
			updateActions();
			updatePublishState();
			
			addMessage("Activity status changed successfully!",250,6000,4000);
		  });
		$("#StatusIcon").attr("src",sRootPath + "/admin/_images/icons/Status" + $(this).val() + ".png");
	});
	/* // END STATUS CHANGER */
	
	/* DIALOG WINDOWS */
	/* ACTIVITY DIALOG */
	$("#ActivityList").dialog({ 
		title:"Activity List",
		modal: false, 
		autoOpen: cActListOpen,
		height:cActListHeight,
		width:cActListWidth,
		position:[cActListPosX,cActListPosY],
		resizable: true,
		dragStop: function(ev,ui) {
			$.post(sRootPath + "/_com/UserSettings.cfc", { method:'setActListPos', position: ui.position.left + "," + ui.position.top });
		},
		open:function() {
			updateActivityList();
			$("#ActivityList").show();
			$.post(sRootPath + "/_com/UserSettings.cfc", { method:'setActListOpen', IsOpen: 'true' });
			$("#ActivityDialogLink").fadeOut();
			
		},
		close:function() {
			$("#ActivityList").html("");
			$("#ActivityDialogLink").fadeIn();
			$.post(sRootPath + "/_com/UserSettings.cfc", { method:'setActListOpen', IsOpen: 'false' });
		},
		resizeStop:function(ev,ui) {
			$.post(sRootPath + "/_com/UserSettings.cfc", { method:'setActListSize', Size: ui.size.width + ',' + ui.size.height });
		}
	});
	
	
	
	$("#ActivityDialogLink").click(function() {
		$("#ActivityList").dialog("open");
	});
	
	
	/* // END ACTIVITY DIALOG */
	
	/* MOVE DIALOG */
	$("#MoveDialog").dialog({ 
		title:"Move Activity",
		modal: true, 
		autoOpen: false,
		position:[150,150],
		buttons: { 
			Continue:function() {
				$.post(sRootPath + "/ajax_adm_activity/", { method:'Move', FromActivityID: nActivity, ToActivityID: $("#ToActivity").val() }, function(data) {
					window.location=sMyself + 'Activity.Detail?ActivityID=' + nActivity + '&Message=Activity successfully moved.';
				});
				
			}, 
			Cancel:function() {
				$("#MoveDialog").dialog("close");
			}
		},
		height:200,
		width:450,
		resizable: false,
		draggable: true,
		open:function() {
			$("#MoveDialog").show();
		},
		close:function() {
			
		}
	});
	
	$("#MoveLink").click(function() {
		$("#MoveDialog").dialog("open");
	});
	/* // END MOVE DIALOG */
	
	/* COPY AND PASTE DIALOG */
	$("#CopyDialog").dialog({ 
		title:"Copy &amp; Paste Activity",
		modal: true, 
		autoOpen: false,
		position:[200,200],
		overlay: { 
			opacity: 0.5, 
			background: "black" 
		} ,
		buttons: { 
			Continue:function() {
				continueCopy()
			}, 
			Cancel:function() {
				cancelCopy();
				$("#CopyDialog").dialog("close");
			}
		},
		height:230,
		width:400,
		resizable: false,
		draggable: true,
		open:function() {
			$("#CopyDialog").show();
		},
		close:function() {
			cancelCopy()
		}
	});
	
	$("#CopyLink").click(function() {
		setCurrActivityType(nActivityType);
		$("#CopyDialog").dialog("open");
		$("#NewActivityTitle").val("Copy of " + sActivityTitle);
		$("#NewActivityTitle").focus();
		$("#NewActivityTitle").select();
	});
	
	$(".CopyChoice").change(function() {
		var sID = $.Replace(this.id, "CopyChoice", "");
		
		if(sID == 2) {
			$("#ParentActivityOptions").hide();
		} else {
			$("#ParentActivityOptions").show();
		}
	});
	
	$("#NewActivityType").bind("change", this, function() {
		var nID = $(this).val();
		
		if(nID != "") {
			getGroupingList(nID);
		} else {
			$("#NewGroupingSelect").hide();
			$("#NewGrouping").val("");
		}
	});
	/* // END COPY AND PASTE DIALOG */
	
	/* NOTES DIALOG */
	$("#NotesList").dialog({ 
		title:"Notes",
		modal: false, 
		autoOpen: cActNotesOpen,
		height:430,
		width:390,
		position:[cActNotesPosX,cActNotesPosY],
		resizable: false,
		dragStop: function(ev,ui) {
			$.post(sRootPath + "/_com/UserSettings.cfc", { method:'setActNotesPos', position: ui.position.left + "," + ui.position.top });
		},
		open:function() {
			$("#NotesList").show();
			$("#frmNotes").attr("src",sMyself + "Activity.Notes?ActivityID=" + nActivity);
			$.post(sRootPath + "/_com/UserSettings.cfc", { method:'setActNotesOpen', IsOpen: 'true' });
			$("#NotesDialogLink").fadeOut();
		},
		close:function() {
			updateNoteCount();
			
			$("#NotesDialogLink").fadeIn();
			$("#frmNotes").attr("src","javascript://");
			$.post(sRootPath + "/_com/UserSettings.cfc", { method:'setActNotesOpen', IsOpen: 'false' });
		}
	});

	$("#NotesDialogLink").click(function() {
		$("#NotesList").dialog("open");
	});
	/* // END NOTES DIALOG */
	
	/* OVERVIEW DIALOG */
	$("#OverviewList").dialog({ 
		title:"Activity Overview",
		modal: false, 
		autoOpen: false,
		height:550,
		width:740,
		position: [100,100],
		resizable: true,
		open:function() {
			$.post(sMyself + "Activity.Overview", { ActivityID: nActivity },
				function(data) {
					$("#OverviewList").html(data);
			});
		},
		close:function() {
			$("#OverviewDialogLink").fadeIn();
			$("#OverviewList").html("");
		},
		buttons: { 
			Print:function() {
				$("#OverviewList").printArea();
			}, 
			Close:function() {
				$("#OverviewList").dialog("close");
			}
		}
	});

	$("#OverviewDialogLink").click(function() {
		$("#OverviewList").dialog("open");
	});
	/* // END OVERVIEW DIALOG */
	
	/* START DELETE ACTIVITY */
	$("#DeleteActivityLink").bind("click", this, function() {
		var sReason = prompt("Do you really want to delete '" + sActivityTitle + "'?  What is the reason?","");
		
		if(sReason != null && sReason != "") {
			$.getJSON(sRootPath + "/ajax_adm_activity/deleteactivity", { method: "", ActivityID: nActivity, Reason: sReason, returnFormat: "plain" },
				function(data) {
					if(data.STATUS) {
						window.location = sMyself + "Activity.Home?Message=" + data.STATUSMSG;
					} else {
						addError(data.STATUSMSG,250,6000,4000);
					}
			});
		} else {
			addError('Please provide a reason.',250,6000,4000);
		}	
	});
	/* END DELETE ACTIVITY */
		
	/* PROCESS QUEUES DIALOG */
	$("#ProcessQueueDialog").dialog({ 
		title:"Process Queues",
		modal: true, 
		autoOpen: false,
		overlay: { 
			opacity: 0.5, 
			background: "black" 
		},
		buttons: { 
			Continue:function() {
				frmProcessQueue.addToQueue();
			}, 
			Cancel:function() {
				$("#ProcessSelect").val("");
				$(this).dialog("close");
			}
		},
		height:400,
		width:560,
		resizable: false,
		open:function() {
			$("#ProcessQueueDialog").show();
		}
	});
	
	$("#ProcessSelect").change(function() {
		$("#frmProcessQueue").attr("src",sMyself + "Process.AddToQueue?ActivityID=" + nActivity + "&ProcessID=" + $(this).val());
		$("#ProcessQueueDialog").dialog("open");
	});
	
	$("#ProcessSelect").val("");
	/* // END PROCESS QUEUES DIALOG */
	/* // END DIALOG WINDOWS */
});