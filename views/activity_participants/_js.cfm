<cfoutput>
<script>
ccpd.tier3 = new ccpd.core.pagelet({
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
	status4Count:#failCount#,
	status2Count:#progressCount#,
	status3Count:#registeredCount#,
	status1Count:#completeCount#,
	status0Count:#totalCount#,
	totalAttendeeCount:#totalCount#,
	totalAttendeeList:#serializeJSON(queryToStruct(qAttendees))#,
	rowsPerPage:15,
	totalPages: Math.ceil(#totalCount# / 15)
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
</cfoutput>