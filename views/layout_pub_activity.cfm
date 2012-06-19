<cfoutput>
#includePartial(partial="/activities/js")#
#includePartial(partial="js")#
	<div class="profile viewer row">
		<div class="profile-bg"></div>
		
		<div class="projectBar span4">
			#includePartial(partial="/activities/sublayout/pub_photo")#
			#includePartial(partial="/activities/sublayout/pub_tabs")#
		</div>
		
		<div class="titleBar span20">
			<h3 class="pull-left">#includeContent("pageTitle")#</h3>
			
			<cfif isLoggedIn() AND isAdmin()>
			<div class="pull-right mrm">
				<a href="/activities/edit/#activity.id#" class="btn"><i class="icon-pencil"></i> Edit Activity</a>
			</div>
			</cfif>
		</div>
		
		<div class="contentBar span15">
			#includeContent()#
		</div>
		
		<div class="infoBar span5">
			#includeContent("otherOptions")#
			#includePartial(partial="/activities/sublayout/pub_infobar")#
		</div>
	</div>
</cfoutput>