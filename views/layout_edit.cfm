<cfoutput>
<div class="profile editor row">
	<div class="projectBar span4">
		#includePartial(partial="sublayout/edit_photo")#
		#includePartial(partial="sublayout/edit_tabs")#
	</div>
	<div class="contentBar span16">
		<h3>#includeContent("pageTitle")#</h3>
		
		#includeContent()#
	</div>
	<div class="infoBar span4">
		<div class="well well-small">
		
		</div>
	</div>
</div>
</cfoutput>