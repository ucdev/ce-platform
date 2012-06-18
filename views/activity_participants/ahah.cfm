<cfparam name="params.Page" default="0">

<script type="text/javascript">
<cfoutput>
status4Count = #failCount#;
status2Count = #progressCount#;
status3Count = #registeredCount#;
status1Count = #completeCount#;
status0Count = #totalCount#;
TotalAttendeeCount = #totalCount#;
TotalAttendeeList = '#TotalAttendeeList#';
totalPages = #attendeePager.getTotalNumberOfPages()#;
</cfoutput>

$(document).ready(function() {
	// UPDATED SELECTED MEMBER COUNT
	$("#CheckedCount").html("(" + SelectedCount + ")");
	$(".EditDateField").mask("99/99/9999");
	
	updatePagesDropdown();
	updateAttendeeFilterCounts();
	
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
                    	<input type="hidden" name="currentAttendeeStatus" id="current-attendee-status-#qAttendees.attendeeid#" value="<cfif qAttendees.statusId EQ 2>3<cfelse>#qAttendees.statusId#</cfif>" /><!--- THE 3 IS TO POINT IT TO THE REGISTEREDDATE FOR THE ATTENDEE ON EDIT IF THE REGISTRANT IS IN PROGRESS --->
                    	<input type="hidden" name="currentAttendeeDate" id="current-attendee-date-#qAttendees.attendeeid#" value="#currStatusDate#" />
                        <!--- VIEW ATTENDEE DATE --->
                    	<div id="view-attendee-date-#qAttendees.AttendeeId#">
                            <div class="btn-group pull-left">
                                <a class="btn" data-toggle="dropdown" id="datefill-#qAttendees.attendeeid#">
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
                                            FAILED (#currStatusDate#)
                                        </cfcase>
                                    </cfswitch>
                                </a>
                                <a id="editstatusdate-#qAttendees.attendeeId#" class="btn EditStatusDate">
                                    <span style="position:relative;"><input type="hidden" id="CurrStatusDate-#qAttendees.attendeeId#" value="" />Edit</span>
                                </a>
                                <a class="btn dropdown-toggle" data-toggle="dropdown">
                                    <span class="caret"></span>
                                </a>
                                <ul class="dropdown-menu pull-right" id="view-attendee-statuses-#qAttendees.attendeeId#">
	                                <cfif qAttendees.CompleteDate NEQ "" AND qAttendees.StatusID EQ 1>
                                	<li><a href="javascript://" class="view-attendee-statusdate" id="AttendeeStatus-#qAttendees.attendeeid#-1"><cfif qAttendees.StatusID EQ 1><i class="icon-ok active-status"></i> </cfif>COMPLETE (#dateFormat(qAttendees.completeDate, "MM/DD/YYYY")#)</a></li>
                                    </cfif>
                                    <cfif qAttendees.StatusID EQ 2>
                                    <li><a href="javascript://" class="view-attendee-statusdate" id="AttendeeStatus-#qAttendees.attendeeid#-3"><i class="icon-ok active-status"></i> IN PROGRESS</a></li><!--- THE 3 ON THE ID IS TO POINT IT TO THE REGISTEREDDATE FOR THE ATTENDEE ON EDIT --->
                                    </cfif>
                                    <cfif qAttendees.RegisterDate NEQ "" OR qAttendees.StatusID EQ 3>
                                    <li><a href="javascript://" class="view-attendee-statusdate" id="AttendeeStatus-#qAttendees.attendeeid#-3"><cfif qAttendees.StatusID EQ 3><i class="icon-ok active-status"></i> </cfif>REGISTERED (#dateFormat(qAttendees.registerDate, "MM/DD/YYYY")#)</a></li>
                                    </cfif>
                                    <cfif qAttendees.TermDate NEQ "" OR qAttendees.StatusID EQ 4>
                                    <li><a href="javascript://" class="view-attendee-statusdate" id="AttendeeStatus-#qAttendees.attendeeid#-4"><cfif qAttendees.StatusID EQ 4><i class="icon-ok active-status"></i> </cfif>FAILED (#dateFormat(qAttendees.termDate, "MM/DD/YYYY")#)</a></li>
                                    </cfif>
                                </ul>
                            </div>
                        </div>
                        
                        <!--- EDIT ATTENDEE DATE FORM --->
                        <span id="edit-attendee-date-#qAttendees.AttendeeId#" style="display:none;position:relative;">
                        	<input type="text" class="EditDateField span3" id="EditDateField-#qAttendees.attendeeId#" />
                            <i class="SaveDateEdit icon-ok" id="SaveDate-#qAttendees.attendeeId#"></i>
                            <i class="CancelDateEdit icon-remove" id="CancelDate-#qAttendees.attendeeId#"></i>
                        </span>
                    </td>
                    <td valign="top" class="user-actions-outer">
					<cfif personID GT 0>
                        <div class="btn-group user-actions action-menu pull-left">
                            <button class="btn dropdown-toggle" data-toggle="dropdown">
                                <i class="icon-cog"></i><span class="caret"></span>
                            </button>
                        </div>
					<cfelse>
                        <a href="javascript://" class="deleteLink">Delete</a>
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