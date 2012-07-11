<cfoutput>
	#includePartial(partial="/activities/js")#
	<div id="tier2" class="profile editor row">
		<div class="profile-bg">
			<div class="profile-bg-inner"></div>
		</div>
		
		<div class="projectBar span4">
			#includePartial(partial="/activities/sublayout/edit_photo")#
			#includePartial(partial="/activities/sublayout/edit_tabs")#
		</div>
		
		<div class="titleBar span20">
			<h3 class="pull-left mls">#includeContent("pageTitle")#</h3>
			<div class="pull-right mrm">
				<a href="/activities/show/#activity.id#" class="btn"><i class="icon-chevron-left"></i> View Activity</a>
			</div>
		</div>
		
		<div id="tier3" class="contentBar span15">
			<div class="loader" style="display:none"><img src="/images/255.png" /></div>
			#includeContent()#
		</div>
		
		<div class="infoBar span5">
			#includeContent("otherOptions")#
			#includePartial(partial="/activities/sublayout/edit_infobar")#
		</div>
	</div>
</cfoutput>