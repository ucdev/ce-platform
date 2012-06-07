<cfoutput>
<cfset tabs = [
	{ 'icon':'card-address', 'label': 'General Info', 'action':'adm_general' },
	{ 'icon':'trophy', 'label': 'Credits', 'action':'adm_credit' },
	{ 'icon':'users', 'label': 'Participants', 'action':'adm_participants' },
	{ 'icon':'user-business', 'label': 'Faculty', 'action':'adm_faculty' },
	{ 'icon':'user-female', 'label': 'Committee', 'action':'adm_committee' },
	{ 'icon':'chart-up-color', 'label': 'Finances', 'action':'adm_finances',
		'subnav':[
			{ 'icon':'', 'label': 'Ledger', 'action':'adm_finances_ledger' },
			{ 'icon':'', 'label': 'Support', 'action':'adm_finances_support' },
			{ 'icon':'', 'label': 'Fees', 'action':'adm_finances_fees' }
		]
	},
	{ 'icon':'inbox-document', 'label': 'Documents', 'action':'adm_documents' },
	{ 'icon':'sticky-note-pin', 'label': 'Notes', 'action':'adm_notes' },
	{ 'icon':'calendar', 'label': 'Schedule', 'action':'adm_agenda' },
	{ 'icon':'envelope', 'label': 'Application', 'action':'adm_app' },
	
	{ 'icon':'bug', 'label': 'CDC', 'action':'adm_cdc' },
	{ 'icon':'accme', 'label': 'ACCME', 'action':'adm_accme' },
	{ 
		'icon':'globe-green', 'label': 'Publish', 'action':'adm_publish',
		'subnav':[
			{ 'icon':'', 'label': 'Categories', 'action':'adm_publish_categories' },
			{ 'icon':'', 'label': 'Specialties', 'action':'adm_publish_specialties' },
			{ 'icon':'', 'label': 'Designer', 'action':'adm_publish_designer' }
		]
	},
	{ 'icon':'report', 'label': 'Reports', 'action':'adm_reports' },
	{ 'icon':'clock-history', 'label': 'History', 'action':'adm_history' }
] />
<p>
<ul class="nav nav-list">
	<cfloop from="1" to="#arrayLen(tabs)#" index="i">
		<cfset tab = tabs[i] />
		<cfset tab['activeSubTab'] = '' />
		<cfset tab['subTabsHtml'] = '' />
		
		<!--- build subnav --->
		<cfif structKeyExists(tab,'subnav') AND arrayLen(tab.subnav) GT 0>
			<cfset tab['subTabsHtml'] = '<ul class="subnav subnav-list">' />
			<cfloop from="1" to="#arrayLen(tab.subnav)#" index="e">
				<cfset subtab = tab.subnav[e] />
				
				<cfif params.action EQ subtab.action>
					<cfset tab.activeSubTab = subtab.action />
					<cfset tab.subTabsHtml &= '<li class="active">' />
				<cfelse>
					<cfset tab.subTabsHtml &= '<li>' />
				</cfif>
				
				<cfset tab.subTabsHtml &= '<a href="#urlFor(action=subtab.action,key=params.key)#">#subtab.label#</a>' />
				
				<cfset tab.subTabsHtml &= '</li>' />
			</cfloop>
			<cfset tab.subTabsHtml &= '</ul>' />
		</cfif>
	<li<cfif params.action EQ tab.action OR params.action EQ tab.activeSubTab> class="active"</cfif>>
		<a href="#urlFor(action=tab.action,key=params.key)#"><i class="icon16-#tab.icon#"></i> #tab.label#</a>
		#tab.subTabsHtml#
	</li>
	</cfloop>
</ul>
</p>
</cfoutput>