<cfoutput>
<script>
//LEGACY STUFF
cActNotesPosX = 0;
cActNotesPosY = 0;
cActNotesOpen = false;
cActListPosX = 0;
cActListPosY = 0;
cActListOpen = false;
cActListHeight = 0;
cActListWidth = 0;
sMyself = '';
sRootPath = '';
sLocation = sMyself + '';
nActivity = #Attributes.ActivityID#;
sActivityTitle = "#jsStringFormat(#activity.title#)#";
nActivityType = #activity.ActivityTypeID#;
<cfif isDefined("activity.groupingId") AND activity.GroupingID NEQ "">
	nGrouping = #activity.GroupingID#;
<cfelse>
	nGrouping = 0;
</cfif>

<!---cActNotesPosX = #getToken(Cookie.USER_ActNotesPos,1,",")#;
cActNotesPosY = #getToken(Cookie.USER_ActNotesPos,2,",")#;
cActNotesOpen = #Cookie.USER_ActNotesOpen#;
cActListPosX = #getToken(Cookie.USER_ActListPos,1,",")#;
cActListPosY = #getToken(Cookie.USER_ActListPos,2,",")#;
cActListOpen = #Cookie.USER_ActListOpen#;
cActListHeight = #GetToken(Cookie.USER_ActListSize,2,",")#;
cActListWidth = #GetToken(Cookie.USER_ActListSize,1,",")#;--->

</script>

#javaScriptIncludeTag(bundle="#application.version_token#/ccpd.activity")#
</cfoutput>