<cfoutput>
#includePartial(partial="/activities/js")#
#includePartial(partial="js")#
<div class="profile editor row">
	<div class="projectBar span4">
		#includePartial(partial="/activities/sublayout/edit_photo")#
		#includePartial(partial="/activities/sublayout/edit_tabs")#
	</div>
	<div class="contentBar <cfif params.showInfoBar>span16<cfelse>span20</cfif>">
		<h3>#includeContent("pageTitle")#</h3>
		
		#includeContent()#
	</div>
	<cfif params.showInfoBar>
	<div class="infoBar span4">
		#includePartial(partial="/activities/sublayout/edit_infobar")#
	</div>
	</cfif>
</div>
</cfoutput>