<cfoutput>
#javascriptIncludeTag(bundle="ce.activities")#
<script>
/*CE.addInitializer(function(options) {
	debug.info("init: activity");
});*/

$(document).ready(function() {
	var activity = $.extend({},
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
</cfoutput>