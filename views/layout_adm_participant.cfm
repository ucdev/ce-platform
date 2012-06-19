<cfoutput>
#includePartial(partial="/attendees/_js")#
<div class="profile editor row">
	<div class="projectBar span4">
		#includePartial(partial="/attendees/sublayout/edit_photo")#
		#includePartial(partial="/attendees/sublayout/edit_tabs")#
	</div>
	<div class="contentBar span20">
		<h3>#includeContent("pageTitle")#</h3>
		
		#includeContent()#
	</div>
</div>
</cfoutput>