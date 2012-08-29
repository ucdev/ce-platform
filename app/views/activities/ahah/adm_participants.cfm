<cfparam name="Attributes.Page" default="0">

<script type="text/javascript">
<cfoutput>
var nId = #Attributes.Page#;
var dtStatusMask = '#DateFormat(Now(), "MM/DD/YYYY")# #TimeFormat(Now(), "hh:mmTT")#';
</cfoutput>
function cancelButton() {
	$("#CreditsDialog").dialog("close");
}

function updateStatusDate($Attendee,$Type) {
	if($Type != "") {
		$.post(sRootPath + "/_com/AJAX_Activity.cfc", { method: "getAttendeeDate", AttendeeId: $Attendee, type: $Type, returnFormat: "plain" },
			function(data) {
				var cleanData = $.Trim(data);
				$("#datefill-" + $Attendee).html(cleanData);
				$("#editdatelink-" + $Attendee).show();
		});
	} else {
		$("#datefill-" + $Attendee).html("");
		$("#editdatelink-" + $Attendee).hide();
	}
}

function resetAttendee(nA,nP,sP) {
	$.getJSON(sRootPath + "/_com/AJAX_Activity.cfc", { method: "resetAttendee", attendeeId: nP, ActivityID: nA, PaymentFlag: sP, returnFormat: "plain" },
		function(data) {
			if(data.STATUS) {				
				addMessage(data.STATUSMSG,250,6000,4000);
				updateActions();
				updateStats();
				updateRegistrants();
			} else {
				addError(data.STATUSMSG,250,6000,4000);
			}
		});
}

function checkmarkMember(params) {
	/*if(settings.person && settings.person > 0) {
		if($.ListFind(SelectedMembers, settings.person, ",")) {
			$("#Checked" + settings.person).attr("checked",true);
			$("#PersonRow" + settings.person).css("background-color","#FFD");
		}
	}*/
	
	if(settings.attendee && settings.attendee > 0) {
		if($.ListFind(SelectedAttendees, settings.attendee, ",")) {
			$("#Checked-" + settings.attendee).attr("checked",true);
			$("#attendeeRow-" + settings.attendee).css("background-color","#FFD");
		}
	}
}

$(document).ready(function() {
	// UPDATED SELECTED MEMBER COUNT
	$("#CheckedCount").html("(" + SelectedCount + ")");
	$(".EditDateField").mask("99/99/9999 99:99aa");
		
	/* CHECK/UNCHECK ALL CHECKBOXES */
	$("#CheckAll").click(function() {
		if($("#CheckAll").attr("checked")) {
			$(".AllAttendees").each(function() {
				var $row = $(this);
				var $checkBox = $row.find('.MemberCheckbox');
				var nPerson = $row.find('.personId').val();
				var nAttendee = $row.find('.attendeeId').val();
				
				// ADD CURRENT MEMBER TO SELECTEDMEMBERS LIST
				addSelectedAttendee({
					person:nPerson,
					attendee:nAttendee
				});
				
				$checkBox.attr("checked",true);
				
				// CHANGE BACKGROUND COLOR OF PERSONROW
				$row.css("background-color","#FFD");
			});
		} else {
			$(".AllAttendees").each(function() {
				var $row = $(this);
				var $checkBox = $row.find('.MemberCheckbox');
				var nPerson = $row.find('.personId').val();
				var nAttendee = $row.find('.attendeeId').val();
				
				// ADD CURRENT MEMBER TO SELECTEDMEMBERS LIST
				removeSelectedPerson({
					person:nPerson,
					attendee:nAttendee
				});
				
				$checkBox.attr("checked",false);
				
				// CHANGE BACKGROUND COLOR OF PERSONROW
				$row.css("background-color","#FFF");
			});
		}
	}); 
	
	$(".deleteLink").one("click",function() {
		var $row = $(this).parents('.personRow');
		var attendee = $row.find('.attendeeId').val();
		
		$.ajax({
			type:'post',
			dataType:'json',
			url:'/admin/_com/ajax_activity.cfc',
			data:{
				'method':'removeAttendeeByID',
				'attendeeId':attendee
			},
			async:false,
			success:function(data) {
				if(data.STATUS) {
					$row.remove();
				}
			}
		});
	});
	
	$("#PersonDetail").dialog({ 
			title: "Person Detail",
			modal: true, 
			autoOpen: false,
			height:550,
			width:855,
			position:[100,100],
			resizable: false,
			dragStop: function(ev,ui) {
				
			},
			open:function() {
				$("#frameDetail").attr('src',sMyself + 'Person.Detail?PersonID=' + nPersonID + '&Mini=1');
			},
			close:function() {
				
			},
			resizeStop:function(ev,ui) {
			}
		});
		
		
	$(".PersonLink").click(function() {
		nPersonID = $.ListGetAt(this.id,2,"|");
		sPersonName = $.ListGetAt(this.id,3,"|");

		$("#PersonDetail").dialog("open");
		return false;
	});
	
	// EDIT REGISTRATION DATE FIELD
	$(".EditCheckinLink").bind("click", this, function() {
		nPersonID = $.Replace(this.id, "Checkin", "");
		
		// HIDE ALL EDIT FIELDS
		$(".CheckinEdit").hide();
		$(".CheckinOutput").show();
		
		// REVEAL CURRENT EDIT FIELD
		$("#CheckinOutput" + nPersonID).hide();
		$("#CheckinEdit" + nPersonID).show();
	});
	
	$(".AttendeeStatusID").change(function() {
		var $Attendee = $.ListGetAt(this.id, 2, "-");
		var $Type = $(this).val();
		
		updateStatusDate($Attendee,$Type);
	});
	
	$(".EditStatusDate").bind("click", this, function() {
		var CurrID = this.id;
		var nAttendee = $.ListGetAt(this.id, 2, "-");
		var dtCurrDate = $.Trim($("#datefill-" + nAttendee).html());
		var sDate = $.ListGetAt(dtCurrDate, 1," ");
		var sTime = $.ListGetAt(dtCurrDate, 2," ");
		var nHour = $.ListGetAt(sTime, 1, ":");
		
		if($.Len(nHour) == 1) {
			nHour = "0" + nHour;
			dtCurrDate = sDate + " " + nHour + ":" + $.ListGetAt(sTime, 2, ":");
		}
		
		$("#CurrStatusDate-" + nAttendee).val(dtCurrDate);
		$("#EditDateField-" + nAttendee).val(dtCurrDate);
		
		$("#editdatelink-" + nAttendee).hide();
		$("#datefill-" + nAttendee).hide();
		$("#editdatecontainer-" + nAttendee).show();
	});
	
	$(".EditDateField").keydown(function() {
		if($.Len($(this).val()) > 0) {
			dtStatusMask = $(this).val();
		}
	});
	
	$(".SaveDateEdit").bind("click", this, function() {
		var CurrID = this.id;
		var nAttendee = $.ListGetAt(this.id, 2, "-");
		var nType = $("#AttendeeStatus-" + nAttendee).val();
		var dtDate = $("#EditDateField-" + nAttendee).val();
		
		if(nType != "" && $.Len(dtDate) > 0) {
			$.post(sRootPath + "/_com/AJAX_Activity.cfc", { method: "saveAttendeeDate", attendeeId: nAttendee, DateValue: dtDate, Type: nType, returnFormat: "plain" },
				function(data) {
					var cleanData = $.Trim(data);
					var Status = $.ListGetAt(cleanData, 1, "|");
					var statusMsg = $.ListGetAt(cleanData, 2, "|");
					
					if(Status == "Success") {
						addMessage(statusMsg,250,6000,4000);
						updateRegistrants(nId);
					} else {
						addError(statusMsg,250,6000,4000);
						$("#editdatecontainer-" + nAttendee).hide();
						$("#datefill-" + nAttendee).show();
						$("#editdatelink-" + nAttendee).show();
					}
			});
		} else {
			addError("You must provide full date and time.",250,6000,4000);
			$("#EditDateField-" + nAttendee).focus();
			$("#EditDateField-" + nAttendee).val(dtStatusMask);
		}
	});
});
</script>

<cfoutput>
<h3>Registrants</h3>
<div class="attendees-filter">
	<ul>
    	<li id="attendees-0"<cfif attributes.status EQ 0> class="current"</cfif>><a href="javascript://">All (<cfoutput>#totalCount#</cfoutput>)</a></li>
    	<li id="attendees-1"<cfif attributes.status EQ 1> class="current"</cfif>><a href="javascript://">Complete (<cfoutput>#completeCount#</cfoutput>)</a></li>
    	<li id="attendees-4"<cfif attributes.status EQ 4> class="current"</cfif>><a href="javascript://">Failed (<cfoutput>#failCount#</cfoutput>)</a></li>
    	<li id="attendees-2"<cfif attributes.status EQ 2> class="current"</cfif>><a href="javascript://">In Progress (<cfoutput>#progressCount#</cfoutput>)</a></li>
    	<li id="attendees-3"<cfif attributes.status EQ 3> class="current"</cfif>><a href="javascript://">Registered (<cfoutput>#registeredCount#</cfoutput>)</a></li>
    </ul>
</div>
<div style="display: none;" id="prototypes">
	<div style="display: none;" id="action_menu">
		<ul style="display: block;" class="round" id="menuActions-{personid}">
        	<cfloop query="qActivityCredits">
                <cfswitch expression="#qActivityCredits.CreditName#">
                    <cfcase value="CME">
                        <li class="pCMECert"><a href="Report.CMECert?ActivityID=#Attributes.ActivityID#&ReportID=5&SelectedMembers={personid}"><i/>CME Certificate</a></li>
                    </cfcase>
                    <cfcase value="CNE">
                        <li class="CNECert"><a href="Report.CNECert?ActivityID=#Attributes.ActivityID#&ReportID=6&SelectedMembers={personid}"><i/>CNE Certificate</a></li>
                    </cfcase>
                </cfswitch>
            </cfloop>
            <li class="sendCertificate"><a href="javascript:void(0);"><i/>Send Certificate</a></li>
			<li class="assess"><a href="#myself#Activity.AttendeeDetails?ActivityID={activityid}&PersonID={personid}"><i/>Assessments</a></li>
			<li class="pifform"><a href="#myself#Activity.AttendeeCDC?ActivityID={activityid}&PersonID={personid}"><i/>PIF Form</a></li>
			<li class="credits"><a href="#myself#Activity.AdjustCredits?ActivityID={activityid}&PersonID={personid}"><i/>Credits</a></li>
			<li class="togglemd"><a href="javascript:void(0);"><i/>Toggle MD</a></li>
			<li class="reset"><a href="javascript:void(0);"><i/>Reset <span>user</span></a></li>
			<li class="remove"><a href="javascript:void(0);"><i/>Remove <span>user</span></a></li>
		</ul>
	</div>
</div>
</cfoutput>
<style>
#pifForm { overflow:auto; height:356px; }
</style>

<cfif isDefined("qAttendees") AND qAttendees.RecordCount GT 0>
	<cfif AttendeePager.getTotalNumberOfPages() GT 1><div style="clear:both;"><cfoutput>#AttendeePager.getRenderedHTML()#</cfoutput></div></cfif>
    <table border="0" width="620" cellpadding="0" cellspacing="0" class="ViewSectionGrid">
        <thead>
            <tr>
                <th width="15"><input type="checkbox" name="CheckAll" id="CheckAll" /></th>
                <th width="200">Name</th>
                <th width="150">Status Date</th>
                <th>Status</th>
                <th>Is MD?</th>
                <th>&nbsp;</th>
            </tr>
        </thead>
        <tbody>
            <cfoutput query="qAttendees" startrow="#AttendeePager.getStartRow()#" maxrows="#AttendeePager.getMaxRows()#">
                <tr id="attendeeRow-#qAttendees.attendeeId#" class="personRow AllAttendees<cfif qAttendees.personDeleted> personDeleted</cfif>" rel="##PersonOptions#PersonID#">
                    <td valign="top">
						<input type="checkbox" name="Checked" class="MemberCheckbox" id="Checked-#attendeeId#" value="#attendeeId#" />
						<input type="hidden" class="attendeeId" value="#attendeeId#" />
						<input type="hidden" class="personId" value="#qAttendees.personId#" />
					</td>
                    <td valign="top" nowrap="nowrap">
						<cfif personId GT 0>
							<a href="#myself#Person.Detail?PersonID=#PersonID#" class="PersonLink" id="PERSON|#PersonID#|#LastName#, #FirstName#">#qAttendees.FullName#</a>
						<cfelse>
							#qAttendees.FullName#
						</cfif>
						
						<!---<cfif NOT qAttendees.personDeleted><a href="#myself#Person.Detail?PersonID=#PersonID#" class="PersonLink" id="PERSON|#PersonID#|#LastName#, #FirstName#">#LastName#, #FirstName# <cfif MiddleName NEQ "">#Left(MiddleName, 1)#.</cfif></a><cfelse>#LastName#, #FirstName# <cfif MiddleName NEQ "">#Left(MiddleName, 1)#.</cfif> **deleted</cfif>---></td>
                    <td class="StatusDate" id="StatusDate-#qAttendees.AttendeeId#">
                    	<span id="datefill-#qAttendees.AttendeeId#">
						<cfswitch expression="#qAttendees.StatusID#">
                        	<cfcase value="1">
                            	#DateFormat(qAttendees.CompleteDate, "MM/DD/YYYY") & " " & TimeFormat(qAttendees.CompleteDate, "h:mmTT")#
                            </cfcase>
                            <cfcase value="2">
                            	#DateFormat(qAttendees.RegisterDate, "MM/DD/YYYY") & " " & TimeFormat(qAttendees.RegisterDate, "h:mmTT")#
                            </cfcase>
                            <cfcase value="3">
                            	#DateFormat(qAttendees.RegisterDate, "MM/DD/YYYY") & " " & TimeFormat(qAttendees.RegisterDate, "h:mmTT")#
                            </cfcase>
                            <cfcase value="4">
                            	#DateFormat(qAttendees.TermDate, "MM/DD/YYYY") & " " & TimeFormat(qAttendees.TermDate, "h:mmTT")#
                            </cfcase>
                        </cfswitch>
                        </span>
						<cfif personID GT 0>
                        <div id="editdatecontainer-#qAttendees.attendeeId#" style="display:none;position:relative;"><input type="text" class="EditDateField" id="EditDateField-#qAttendees.attendeeId#" /><img src="#Application.Settings.RootPath#/_images/icons/tick.png" class="SaveDateEdit" id="SaveDate-#qAttendees.attendeeId#" style="position: absolute; left: -20px; top: 0pt;" /></div>
                        <div id="editdatelink-#qAttendees.attendeeId#" style="position:relative;"><input type="hidden" id="CurrStatusDate-#qAttendees.attendeeId#" value="" /><img src="#Application.Settings.RootPath#/_images/icons/pencil.png" class="EditStatusDate" id="editstatusdate-#qAttendees.attendeeId#" style="position: absolute; top: -16px; left: -20px;" /></div>
						</cfif>
                    </td>
                    <td valign="top">
                    <select name="AttendeeStatusID" class="AttendeeStatusID" id="AttendeeStatus-#qAttendees.attendeeId#"<cfif personId EQ 0> disabled="true"</cfif>>
                    	<option value="">Select one...</option>
                        <cfif qAttendees.CompleteDate NEQ "" OR qAttendees.StatusID EQ 1>
                    		<option value="1"<cfif qAttendees.StatusID EQ 1> SELECTED</cfif>>Complete</option>
						</cfif>
                        <cfif qAttendees.StatusID EQ 2>
                    		<option value="2"<cfif qAttendees.StatusID EQ 2> SELECTED</cfif>>In progress</option>
						</cfif>
                        <cfif qAttendees.RegisterDate NEQ "" OR qAttendees.StatusID EQ 3>
                    		<option value="3"<cfif qAttendees.StatusID EQ 3> SELECTED</cfif>>Registered</option>
						</cfif>
                        <cfif qAttendees.TermDate NEQ "" OR qAttendees.StatusID EQ 4>
                    		<option value="4"<cfif qAttendees.StatusID EQ 4> SELECTED</cfif>>Terminated</option>
						</cfif>
                    </select>
                    </td>
                    <td valign="top"><span class="MDNonMD" id="MDNonMD#qAttendees.attendeeId#"><cfif qAttendees.MDFlag EQ "Y">Yes<cfelse>No</cfif></span></td>
                    <td valign="top" class="user-actions-outer">
						<cfif personID GT 0>
						<ul class="user-actions">
							<li class="action-menu menu">
								<button value="Actions" class="btn" id="btnActions-#PersonID#"><i/></button>
								
							</li>
						</ul>
						<cfelse>
							<a href="javascript:;" class="deleteLink">Delete</a>
						</cfif>
					</td>
                </tr>
            </cfoutput>
        </tbody>
    </table>
	<cfif AttendeePager.getTotalNumberOfPages() GT 1><div><cfoutput>#AttendeePager.getRenderedHTML()#</cfoutput></div></cfif>
<cfelse>
	<cfif attributes.status GT 0>
        <div style="background-image:url(/admin/_images/Sample_Attendees.jpg); font-size: 18px; text-align: center; height: 250px; width: 620px;">
            <div style="padding:25px 20px;">There are no registrants for this activity of this status.</div>
        </div>
    <cfelse>
        <div style="background-image:url(/admin/_images/Sample_Attendees.jpg); font-size: 18px; text-align: center; height: 250px; width: 620px;">
            <div style="padding:25px 20px;">You have not added any registrants.<br />Please click 'Add Registrant' on the right to begin.</div>
        </div>
    </cfif>
</cfif>
<div id="PersonDetailContainer" class="simple_overlay">
	<div id="PersonDetailContent"></div>
</div>