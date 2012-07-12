<cfoutput>
<script>
/*CE.addInitializer(function(options) {
	debug.info("init: activity");
});*/
ce.module("activity",function(self,ce,Backbone,Marionette,$,_) {	
	self = $.extend({},self,
		#serializeJson(activity)#,
		{
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
	);
});
</script>
</cfoutput>