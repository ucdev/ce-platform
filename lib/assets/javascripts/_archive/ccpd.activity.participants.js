function addSelectedRow(b){var a=$.extend({},b);if(a.person&&a.person>0){if(!$.ListFind(SelectedMembers,a.person,",")){SelectedMembers=$.ListAppend(SelectedMembers,a.person,",")}}if(a.attendee&&a.attendee>0){if(!$.ListFind(SelectedAttendees,a.attendee,",")){SelectedAttendees=$.ListAppend(SelectedAttendees,a.attendee,",")}}updateSelectedCount(1)}function cancelButton(){$("#CreditsDialog").dialog("close")}function clearSelectedMembers(){SelectedAttendees="";SelectedMembers="";SelectedCount=0;$("#label-status-selected").html("0")}function removeSelectedRow(b){var a=$.extend({},b);if(a.person&&a.person>0){SelectedMembers=$.ListDeleteAt(SelectedMembers,$.ListFind(SelectedMembers,a.person))}if(a.attendee&&a.attendee>0){SelectedAttendees=$.ListDeleteAt(SelectedAttendees,$.ListFind(SelectedAttendees,a.attendee))}updateSelectedCount(-1)}function resetAttendee(a,c,b){$.ajax({url:"/AJAX_adm_Activity/resetAttendee",type:"post",data:{attendeeId:c,ActivityID:a,PaymentFlag:b},success:function(d){if(d.STATUS){addMessage(d.STATUSMSG,250,6000,4000);updateStats();updateRegistrants()}else{addError(d.STATUSMSG,250,6000,4000)}}})}function saveAttendee(){$.blockUI({message:"<h1>Adding Attendee...</h1>"});$.post("/AJAX_adm_Activity/saveAttendee",{PersonID:$("#AttendeeID").val(),ActivityID:nActivity,returnFormat:"plain"},function(a){cleanData=$.trim(a);status=$.ListGetAt(cleanData,1,"|");statusMsg=$.ListGetAt(cleanData,2,"|");if(status=="Success"){updateRegistrants(nPageNo,nStatus);addMessage(statusMsg,250,6000,4000);$.unblockUI()}else{if(status=="Fail"){addError(statusMsg,250,6000,4000);$.unblockUI();$("#AttendeeName").val("Click To Add Attendee")}}});$("#AttendeeID").val("");$("#AttendeeName").val("Click To Add Attendee")}function updateSelectedCount(a){SelectedCount=SelectedCount+a;if(SelectedCount>0){$(".js-partic-actions .btn").removeClass("disabled")}else{$(".js-partic-actions .btn").addClass("disabled")}$("#label-status-selected").text(SelectedCount);$("#statusSelected span.attendee-status-count").text("("+SelectedCount+")")}$(document).ready(function(){MaxRegistrants=$("#MaxRegistrants").val();AddlAttendees=$("#AddlAttendees").val();NoChange=0;updateRegistrants(nPageNo,nStatus);$("#MaxRegistrants,#AddlAttendees").bind("blur",function(){if(MaxRegistrants!=$("#MaxRegistrants").val()){$.post("/AJAX_adm_Activity/updateMaxRegistrants",{ActivityID:nActivity,MaxRegistrants:$("#MaxRegistrants").val(),returnFormat:"plain"},function(a){cleanData=$.trim(a);status=$.ListGetAt(cleanData,1,"|");statusMsg=$.ListGetAt(cleanData,2,"|");if(status=="Success"){addMessage(statusMsg,250,6000,4000)}else{addError(statusMsg,250,6000,4000)}});MaxRegistrants=$("#MaxRegistrants").val()}else{NoChange=NoChange+1}if(AddlAttendees!=$("#AddlAttendees").val()){$.post("/AJAX_adm_Activity/updateAddlAttendees",{ActivityID:nActivity,AddlAttendees:$("#AddlAttendees").val(),returnFormat:"plain"},function(a){cleanData=$.trim(a);status=$.ListGetAt(cleanData,1,"|");statusMsg=$.ListGetAt(cleanData,2,"|");if(status=="Success"){addMessage(statusMsg,250,6000,4000)}else{addError(statusMsg,250,6000,4000)}});AddlAttendees=$("#AddlAttendees").val()}else{NoChange=NoChange+1}if(NoChange==2){addError("Please adjust the value you want to update and try again.",250,6000,4000);NoChange=0}else{if(NoChange>0){NoChange=0}}});$printer.live("click",function(){})});