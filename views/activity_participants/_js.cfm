<cfoutput>
<script>
/*

CE.addInitializer(function(options) {
	debug.info("init: activity_participants");
});*/

$(document).ready(function() {
	var loadOpts = {
		AddlAttendees:0,
		currAttendee: 0,
		currPerson: 0,
		MaxRegistrants:0,
		NoChange: 0,
		nPageNo: #params.Page#,
		nStatus: #params.status#,
		rows: [],
		selectedRows: '',
		selectedCount: 0,
		totalAttendeeList: [],
		rowsPerPage:15,
		totalPages: 0
	};
	<cfif structKeyExists(cookie, "user_attendee_page") AND GetToken(Cookie.USER_AttendeePage,1,"|") EQ params.ActivityID>
		<cfif getToken(cookie.user_attendeeStatus, 1, "|") EQ params.ActivityId>
		loadOpts.nPageNo = #getToken(Cookie.USER_AttendeePage,2,"|")#;
		loadOpts.nStatus = #getToken(Cookie.USER_AttendeeStatus,2,"|")#;
		<cfelse>
		loadOpts.nPageNo = #getToken(Cookie.USER_AttendeePage,2,"|")#;
		</cfif>
	</cfif>
});


</script>
</cfoutput>