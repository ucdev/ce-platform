<cfoutput>
<cfset tabs = [
	{ 'icon':'card-address', 'label': 'General Info', 'controller':'activities', 'action':'edit' },
	{ 'icon':'trophy', 'label': 'Credits', 'controller':'activity_credits', 'action':'edit' },
	{ 'icon':'users', 'label': 'Participants', 'controller':'activity_participants', 'action':'index' },
	{ 'icon':'user-business', 'label': 'Faculty', 'controller':'activity_faculties', 'action':'index' },
	{ 'icon':'user-female', 'label': 'Committee', 'controller':'activity_committees', 'action':'index' },
	{ 'icon':'chart-up-color', 'label': 'Finances', 'controller':'activity_finances', 'action':'index',
		'subnav':[
			{ 'icon':'', 'label': 'Budget', 'controller':'activity_finbudgets', 'action':'index' },
			{ 'icon':'', 'label': 'Ledger', 'controller':'activity_finledgers', 'action':'index' },
			{ 'icon':'', 'label': 'Support', 'controller':'activity_finsupports', 'action':'index' },
			{ 'icon':'', 'label': 'Fees', 'controller':'activity_finfees', 'action':'index' }
		]
	},
	{ 'icon':'inbox-document', 'label': 'Documents', 'controller':'activity_documents', 'action':'index' },
	{ 'icon':'sticky-note-pin', 'label': 'Notes', 'controller':'activity_notes', 'action':'index' },
	{ 'icon':'calendar', 'label': 'Schedule', 'controller':'activity_schedules', 'action':'index' },
	{ 'icon':'envelope', 'label': 'Application', 'controller':'activity_applications', 'action':'edit' },
	
	{ 'icon':'bug', 'label':'CDC', 'controller':'activity_cdc', 'action':'edit' },
	{ 'icon':'accme', 'label': 'ACCME', 'controller':'activity_accme','action':'edit' },
	{ 
		'icon':'globe-green', 'label': 'Publish', 'controller':'activity_publish','action':'edit',
		'subnav':[
			{ 'icon':'', 'label': 'Categories', 'controller':'activity_containers','action':'edit' },
			{ 'icon':'', 'label': 'Specialties', 'controller':'activity_cdcs','action':'edit' },
			{ 'icon':'', 'label': 'Designer', 'controller':'activity_designer','action':'index' }
		]
	},
	{ 'icon':'report', 'label': 'Reports', 'controller':'activity_reports', 'action':'index' },
	{ 'icon':'clock-history', 'label': 'History', 'controller':'activity_history', 'action':'index' }
] />
<p>
<ul class="nav nav-list">
	<cfloop from="1" to="#arrayLen(tabs)#" index="i">
		<cfset tab = tabs[i] />
		
		<cfset tab['activeSubController'] = '' />
		<cfset tab['activeSubAction'] = '' />
		<cfset tab['subTabsHtml'] = '' />
		
		<!--- build subnav --->
		<cfif structKeyExists(tab,'subnav') AND arrayLen(tab.subnav) GT 0>
			<cfset tab['subTabsHtml'] = '<ul class="subnav subnav-list">' />
			<cfloop from="1" to="#arrayLen(tab.subnav)#" index="e">
				<cfset subtab = tab.subnav[e] />
				
				<cfif params.controller EQ subtab.controller AND params.action EQ subtab.action>
					<cfset tab.activeSubAction = subtab.action />
					<cfset tab.activeSubController = subtab.controller />
					
					<cfset tab.subTabsHtml &= '<li class="active">' />
				<cfelse>
					<cfset tab.subTabsHtml &= '<li>' />
				</cfif>
				
				<cfset tab.subTabsHtml &= '<a href="#urlFor(controller=subtab.controller,action=subtab.action,key=params.activityId)#">#subtab.label#</a>' />
				
				<cfset tab.subTabsHtml &= '</li>' />
			</cfloop>
			<cfset tab.subTabsHtml &= '</ul>' />
		</cfif>
	<li class="<cfif (params.controller EQ tab.controller AND params.action EQ tab.action)>active open</cfif><cfif (params.controller EQ tab.activeSubController AND params.action EQ tab.activeSubAction)> open</cfif>">
		<a href="#urlFor(controller=tab.controller,action=tab.action,key=params.activityId)#"><i class="icon16-#tab.icon#"></i> #tab.label#</a>
		#tab.subTabsHtml#
	</li>
	</cfloop>
</ul>
</cfoutput>