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

<cfif structKeyExists(cookie, "user_attendee_page") AND GetToken(Cookie.USER_AttendeePage,1,"|") EQ params.ActivityID>
<cfif getToken(cookie.user_attendeeStatus, 1, "|") EQ params.ActivityId>
nPageNo = #getToken(Cookie.USER_AttendeePage,2,"|")#;
nStatus = #getToken(Cookie.USER_AttendeeStatus,2,"|")#;
<cfelse>
nPageNo = #getToken(Cookie.USER_AttendeePage,2,"|")#;
</cfif>
</cfif> 
</script>   

#javaScriptIncludeTag(bundle="#application.version_token#/ccpd.activity.participants")#
</cfoutput>