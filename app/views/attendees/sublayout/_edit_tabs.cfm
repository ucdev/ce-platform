<cfoutput>
<cfset tabs = [
	{ 'icon':'card-address', 'label': 'General Info', 'controller':'attendees', 'action':'edit' },
	{ 'icon':'trophy', 'label': 'Address', 'controller':'attendees', 'action':'edit_address' },
	{ 'icon':'users', 'label': 'Phone', 'controller':'attendees', 'action':'edit_phone' }
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
		<a href="#urlFor(controller=tab.controller,action=tab.action,key=params.key,params='activityId=' & params.activityId & '&layout=adm_participant')#"><i class="icon16-#tab.icon#"></i> #tab.label#</a>
		#tab.subTabsHtml#
	</li>
	</cfloop>
</ul>
</cfoutput>