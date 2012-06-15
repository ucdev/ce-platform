<cfoutput>
#includePartial(partial="/activity_participants/js")#
#includePartial(partial="js")#
<div class="profile editor row">
	<div class="projectBar span4">
		#includePartial(partial="/activities/sublayout/edit_photo")#
		#includePartial(partial="/activities/sublayout/edit_tabs")#
	</div>
	<div class="contentBar span20">
		<h3>#includeContent("pageTitle")#</h3>
		
		#includeContent()#
	</div>
</div>
</cfoutput>