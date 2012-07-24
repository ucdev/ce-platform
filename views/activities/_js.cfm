<cfoutput>
<script>
ce.bind("initialize:after", function(options){
	ce.activity.start({
		modelData:#serializeJson(activity)#,
		legacy:{
				cActNotesPosX: 0,
				cActNotesPosY: 0,
				cActNotesOpen: false,
				cActListPosX: 0,
				cActListPosY: 0,
				cActListOpen: false,
				cActListHeight: 0,
				cActListWidth: 0,
				nActivity: #Attributes.ActivityID#,
				sActivityTitle: "#jsStringFormat(#activity.title#)#",
				nActivityType: #activity.ActivityTypeID#,
				
				<cfif isDefined("activity.groupingId") AND activity.GroupingID NEQ "">
				nGrouping: #activity.GroupingID#
				<cfelse>
				nGrouping: 0
				</cfif>
		}
	});
});
</script>
</cfoutput>