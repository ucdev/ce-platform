<cfset currPageNo = params.page>
<cfset currStatus = params.status>

<cfif structKeyExists(cookie, "user_attendee_page") AND GetToken(Cookie.USER_AttendeePage,1,"|") EQ params.ActivityID>
	<cfif getToken(cookie.user_attendeeStatus, 1, "|") EQ params.ActivityId>
    	<cfset currPageNo = getToken(Cookie.USER_AttendeePage,2,"|")>
	    <cfset currStatus = getToken(Cookie.USER_AttendeeStatus,2,"|")>
    <cfelse>
    	<cfset currPageNo = getToken(Cookie.USER_AttendeePage,2,"|")>
    </cfif>
</cfif>

<cfoutput>
<script>
/*

CE.addInitializer(function(options) {
	debug.info("init: activity_participants");
});*/
ce.module("activity.participants",function(self,ce,Backbone,Marionette,$,_) {	
	self = $.extend({},self, {
		AddlAttendees:0,
		currAttendee: 0,
		currPerson: 0,
		MaxRegistrants:0,
		NoChange: 0,
		nPageNo: #currPageNo#,
		nStatus: #currStatus#,
		rows: [],
		selectedRows: '',
		selectedCount: 0,
		totalAttendeeList: [],
		rowsPerPage:15,
		totalPages: 0
		}
	);
});
</script>
</cfoutput>