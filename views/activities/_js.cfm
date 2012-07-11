<cfoutput>
<script>
/*CE.addInitializer(function(options) {
	debug.info("init: activity");
});*/
CE.module("page",function(self,CE,Backbone,Marionette,$,_,activities) {	
	self.params = $.extend({},
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
	
	this.view = Backbone.View.extend({
	  el: "##tier2",
	
	  events: {
		"click ##thatThing": "youClickedIt"
	  },
	
	  youClickedIt: function(){
		alert("you clicked it!");
	  }
	});

},CE.activities);

CE.addInitializer(function() {
	CE.page.router = new CE.activities.router({ controller: new CE.activities.controller });
	
	CE.vent.trigger("routing:started");
});

$(document).ready(function() {
  var el = new CE.page.view().render().el;
  $("##tier1 > .container").append(el);
});
</script>
</cfoutput>