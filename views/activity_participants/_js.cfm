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
$(document).ready(function() {
	ce.activity.participants.load({
		legacy:{
			AddlAttendees:0,
			MaxRegistrants:0,
			NoChange: 0,
			nPageNo: #currPageNo#,
			nStatus: #currStatus#
		}
	});
});
</script>
</cfoutput>