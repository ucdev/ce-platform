<cfparam name="params.Page" default="0">

<script type="text/javascript">
<cfoutput>
status4Count = #failCount#;
status2Count = #progressCount#;
status3Count = #registeredCount#;
status1Count = #completeCount#;
status0Count = #qAttendees.recordCount#;
TotalAttendeeCount = #qAttendees.RecordCount#;
TotalAttendeeList = '#TotalAttendeeList#';
totalPages = #attendeePager.getTotalNumberOfPages()#;
</cfoutput>

$(document).ready(function() {
	// UPDATED SELECTED MEMBER COUNT
	$("#CheckedCount").html("(" + SelectedCount + ")");
	$(".EditDateField").mask("99/99/9999");
	
	<cfoutput>
	updatePagesDropdown(#attendeePager.getTotalNumberOfPages()#);
	</cfoutput>
	
	updateAttendeeFilterCounts();
		
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
			url:'/ajax_adm_activity/removeAttendeeByID',
			data:{
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
	
	$(".AttendeeStatusID").click(function() {
		var nAttendee = this.id.split('-')[1];
		var nType = this.id.split('-')[2];
		
		updateStatusDate(nAttendee,nType);
				
		// PLACE CHECKMARK BY ACTIVE STATUS
		$(this).parent().parent().children().find('a .active-status').remove();
		$(this).prepend('<i class="icon-ok active-status"></i> ');
	});
	
	$(".EditStatusDate").bind("click", this, function() {
		var CurrID = this.id;
		var nAttendee = this.id.split('-')[1];
		var dtCurrDate = $.Trim($("#current-attendee-date-" + nAttendee).val());
		var sDate = dtCurrDate.split(' ')[0];
		
		// SET CURRENT STATUS DATE VALUE IN HTML ELEMENTS
		$("#CurrStatusDate-" + nAttendee).val(dtCurrDate);
		$("#EditDateField-" + nAttendee).val(dtCurrDate);
		
		// SHOW EDIT FORM
		$("#view-attendee-date-" + nAttendee).hide();
		$("#edit-attendee-date-" + nAttendee).show();
	});
	
	$(".EditDateField").keydown(function() {
		if($.Len($(this).val()) > 0) {
			dtStatusMask = $(this).val();
		}
	});
	
	$(".CancelDateEdit").bind("click", this, function() {
		var nAttendee = this.id.split('-')[1];
		
		$("#edit-attendee-date-" + nAttendee).hide();
		$("#view-attendee-date-" + nAttendee).show();
	});
	
	$(".SaveDateEdit").bind("click", this, function() {
		var CurrID = this.id;
		var nAttendee = $.ListGetAt(this.id, 2, "-");
		var nType = $("#current-attendee-status-" + nAttendee).val();
		var dtDate = $("#EditDateField-" + nAttendee).val();
		
		if(nType != "" && $.Len(dtDate) > 0) {
			$.ajax({
				url: "/AJAX_adm_Activity/saveAttendeeDate", 
				type: 'post',
				data: { attendeeId: nAttendee, DateValue: dtDate, Type: nType, returnFormat: "plain" },
				dataType: 'json',
				success: function(data) {
					if(data.STATUS) {
						addMessage(data.STATUSMSG,250,6000,4000);
						updateRegistrants(nId, nStatus);
					} else {
						addError(data.STATUSMSG,250,6000,4000);
						
						$("#editdatecontainer-" + nAttendee).hide();
						$("#datefill-" + nAttendee).text(dtDate).show();
						$("#editdatelink-" + nAttendee).show();
					}
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
<div style="display: none;" id="prototypes">
	<div style="display: none;" id="action_menu">
		<ul class="dropdown-menu" id="menuActions-{personid}">
        	<cfloop query="qActivityCredits">
                <cfswitch expression="#qActivityCredits.CreditName#">
                    <cfcase value="CME">
                        <li class="pCMECert"><a href="Report.CMECert?ActivityID=#params.activityId#&ReportID=5&SelectedMembers={personid}"><i/>CME Certificate</a></li>
                    </cfcase>
                    <cfcase value="CNE">
                        <li class="CNECert"><a href="Report.CNECert?ActivityID=#params.activityId#&ReportID=6&SelectedMembers={personid}"><i/>CNE Certificate</a></li>
                    </cfcase>
                </cfswitch>
            </cfloop>
            <li class="sendCertificate"><a href="javascript:void(0);"><i/>Send Certificate</a></li>
			<li class="assess"><a href="/activity_participants/attendeeDetails?ActivityID={activityid}&PersonID={personid}"><i/>Assessments</a></li>
			<li class="pifform"><a href="/activity/attendeeCDC?ActivityID={activityid}&PersonID={personid}"><i/>PIF Form</a></li>
			<li class="credits"><a href="/activity/adjustCredits?ActivityID={activityid}&PersonID={personid}"><i/>Credits</a></li>
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
    <table border="0" width="620" cellpadding="0" cellspacing="0" class="table">
        <thead>
            <tr>
                <th class="span1"><input type="checkbox" name="CheckAll" id="CheckAll" /></th>
                <th class="span2"></th>
                <th class="span4">Name</th>
                <th class="span8">Status</th>
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
                    <td><img src="/images/no-photo/person_i.png">
						<cfif qAttendees.mdFlag EQ "Y"><div><span class="badge badge-important" style="position: relative; left: 30px; top: -55px;">MD</span></div></cfif></td>
                    <td valign="top" nowrap="nowrap">
						<cfif personId GT 0>
							<a href="/people/edit/#PersonID#" class="PersonLink" id="PERSON|#PersonID#|#LastName#, #FirstName#">#qAttendees.FullName#</a>
						<cfelse>
							#qAttendees.FullName#
						</cfif>
						<div class="attendee-status" id="attendee-status-#qAttendees.attendeeId#">#StatusName#</div>
					</td>
                    <td class="StatusDate" id="StatusDate-#qAttendees.AttendeeId#">
                    	<cfswitch expression="#qAttendees.StatusID#">
                            <cfcase value="1">
                            	<cfset currStatusDate = DateFormat(qAttendees.CompleteDate, "MM/DD/YYYY")>
                            </cfcase>
                            <cfcase value="2">
                            	<cfset currStatusDate = DateFormat(qAttendees.RegisterDate, "MM/DD/YYYY")>
                            </cfcase>
                            <cfcase value="3">
                            	<cfset currStatusDate = DateFormat(qAttendees.RegisterDate, "MM/DD/YYYY")>
                            </cfcase>
                            <cfcase value="4">
                            	<cfset currStatusDate = DateFormat(qAttendees.TermDate, "MM/DD/YYYY")>
                            </cfcase>
                        </cfswitch>
                    	<input type="hidden" name="currentAttendeeStatus" id="current-attendee-status-#qAttendees.attendeeid#" value="#qAttendees.statusId#" />
                    	<input type="hidden" name="currentAttendeeDate" id="current-attendee-date-#qAttendees.attendeeid#" value="#currStatusDate#" />
                        <!--- VIEW ATTENDEE DATE --->
                    	<span id="view-attendee-date-#qAttendees.AttendeeId#">
                            <div class="btn-group">
                                <button class="btn span5" data-toggle="dropdown" id="datefill-#qAttendees.attendeeid#">
                                	<cfswitch expression="#qAttendees.StatusID#">
                                        <cfcase value="1">
                                            COMPLETE (#currStatusDate#)
                                        </cfcase>
                                        <cfcase value="2">
                                            IN PROGRESS
                                        </cfcase>
                                        <cfcase value="3">
                                            REGISTERED (#currStatusDate#)
                                        </cfcase>
                                        <cfcase value="4">
                                            TERMINATED (#currStatusDate#)
                                        </cfcase>
                                    </cfswitch>
                                </button>
                                <button id="editstatusdate-#qAttendees.attendeeId#" class="btn EditStatusDate span2">
                                    <span style="position:relative;"><input type="hidden" id="CurrStatusDate-#qAttendees.attendeeId#" value="" />Edit</span>
                                </button>
                                <button class="btn dropdown-toggle span1" data-toggle="dropdown">
                                    <span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu pull-right">
	                                <cfif qAttendees.CompleteDate NEQ "" AND qAttendees.StatusID EQ 1>
                                	<li><a href="javascript://" class="AttendeeStatusID" id="AttendeeStatus-#qAttendees.attendeeid#-1">COMPLETE (#dateFormat(qAttendees.completeDate, "MM/DD/YYYY")#)</a></li>
                                    </cfif>
                                    <cfif qAttendees.StatusID EQ 2>
                                    <li><a href="javascript://" class="AttendeeStatusID" id="AttendeeStatus-#qAttendees.attendeeid#-2">IN PROGRESS</a></li>
                                    </cfif>
                                    <cfif qAttendees.RegisterDate NEQ "" OR qAttendees.StatusID EQ 3>
                                    <li><a href="javascript://" class="AttendeeStatusID" id="AttendeeStatus-#qAttendees.attendeeid#-3">REGISTERED (#dateFormat(qAttendees.registerDate, "MM/DD/YYYY")#)</a></li>
                                    </cfif>
                                    <cfif qAttendees.TermDate NEQ "" OR qAttendees.StatusID EQ 4>
                                    <li><a href="javascript://" class="AttendeeStatusID" id="AttendeeStatus-#qAttendees.attendeeid#-4">TERMINATED (#dateFormat(qAttendees.termDate, "MM/DD/YYYY")#)</a></li>
                                    </cfif>
                                </ul>
                            </div>
                        </span>
                        
                        <!--- EDIT ATTENDEE DATE FORM --->
                        <span id="edit-attendee-date-#qAttendees.AttendeeId#" style="display:none;position:relative;">
                        	<input type="text" class="EditDateField span3" id="EditDateField-#qAttendees.attendeeId#" />
                            <i class="SaveDateEdit icon-ok" id="SaveDate-#qAttendees.attendeeId#"></i>
                            <i class="CancelDateEdit icon-remove" id="CancelDate-#qAttendees.attendeeId#"></i>
                        </span>
                    </td>
                    <td valign="top" class="user-actions-outer">
						<cfif personID GT 0>
						<!---<ul class="user-actions">
							<li class="action-menu menu">
								<button value="Actions" class="btn" id="btnActions-#PersonID#"><i class="icon-cog"></i></button>
							</li>
						</ul>--->
                        <div class="btn-group user-actions action-menu">
                            <button class="btn dropdown-toggle" data-toggle="dropdown">
                                <i class="icon-cog"></i><span class="caret"></span>
                            </button>
                        </div>
						<cfelse>
							<a href="javascript:;" class="deleteLink">Delete</a>
						</cfif>
					</td>
                </tr>
            </cfoutput>
        </tbody>
    </table>
<cfelse>
	<cfif params.status GT 0>
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