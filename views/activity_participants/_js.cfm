<cfoutput>
<script>
var nPageNo = #params.Page#;
var nStatus = #params.status#;
var SelectedMembers = '';
var SelectedAttendees = '';
var SelectedCount = 0;
var TotalAttendeeCount;
var TotalAttendeeList;
var status4Count;
var status2Count;
var status3Count;
var status1Count;
var status0Count;
var MaxRegistrants;
var AddlAttendees;
var NoChange = 0;
var totalPages;

ccpd.tier3 = new ccpd.core.pagelet({
	nPageNo: #params.Page#,
	nStatus: #params.status#,
	SelectedMembers: '',
	SelectedAttendees: '',
	SelectedCount: 0,
	TotalAttendeeCount:0,
	TotalAttendeeList:'',
	status4Count:0,
	status2Count:0,
	status3Count:0,
	status1Count:0,
	status0Count:0,
	MaxRegistrants:0,
	AddlAttendees:0,
	NoChange: 0,
	totalPages:0
});

<cfif structKeyExists(cookie, "user_attendee_page") AND GetToken(Cookie.USER_AttendeePage,1,"|") EQ params.ActivityID>
<cfif getToken(cookie.user_attendeeStatus, 1, "|") EQ params.ActivityId>
ccpd.tier3.nPageNo = #getToken(Cookie.USER_AttendeePage,2,"|")#;
ccpd.tier3.nStatus = #getToken(Cookie.USER_AttendeeStatus,2,"|")#;
<cfelse>
ccpd.tier3.nPageNo = #getToken(Cookie.USER_AttendeePage,2,"|")#;
</cfif>
</cfif> 
</script>   

#javaScriptIncludeTag(bundle="#application.version_token#/ccpd.activity.participants")#
</cfoutput>