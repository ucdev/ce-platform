<cfoutput>
<cfset tabs = [
	{ 'icon':'card-address', 'label': 'General Info','route':'editActivity','key': params.activityId,'activityId': params.activityId },
	{ 'icon':'trophy', 'label': 'Credits','route':'activityActivity_credits','key': params.activityId,'activityId': params.activityId },
	{ 'icon':'users', 'label': 'Participants','route':'activityActivity_participants','key': params.activityId,'activityId': params.activityId,
		'subnav':[
			{ 'icon':'', 'label': 'Requests', 'controller':'credit_requests', 'action':'index','key': params.activityId,'activityId': params.activityId }
		]
	},
	{ 'icon':'user-business', 'label': 'Faculty','route':'editActivity','key': params.activityId,'activityId': params.activityId },
	{ 'icon':'user-female', 'label': 'Committee','route':'editActivity','key': params.activityId,'activityId': params.activityId },
	{ 'icon':'chart-up-color', 'label': 'Finances','route':'editActivity','key': params.activityId,'activityId': params.activityId,
		'subnav':[
			{ 'icon':'', 'label': 'Budget','route':'editActivity','key': params.activityId,'activityId': params.activityId },
			{ 'icon':'', 'label': 'Ledger','route':'editActivity','key': params.activityId,'activityId': params.activityId },
			{ 'icon':'', 'label': 'Support','route':'editActivity','key': params.activityId,'activityId': params.activityId },
			{ 'icon':'', 'label': 'Fees','route':'editActivity','key': params.activityId,'activityId': params.activityId }
		]
	},
	{ 'icon':'inbox-document', 'label': 'Documents','route':'editActivity','key': params.activityId,'activityId': params.activityId },
	{ 'icon':'sticky-note-pin', 'label': 'Notes','route':'editActivity','key': params.activityId,'activityId': params.activityId },
	{ 'icon':'calendar', 'label': 'Schedule','route':'editActivity','key': params.activityId,'activityId': params.activityId },
	{ 'icon':'envelope', 'label': 'Application','route':'editActivity','key': params.activityId,'activityId': params.activityId },
	
	{ 'icon':'bug', 'label':'CDC', 'controller':'activity_cdc', 'action':'edit','key': params.activityId,'activityId': params.activityId },
	{ 'icon':'accme', 'label': 'ACCME','route':'editActivity','key': params.activityId,'activityId': params.activityId },
	{ 
		'icon':'globe-green', 'label': 'Publish','route':'editActivity','key': params.activityId,'activityId': params.activityId,
		'subnav':[
			{ 'icon':'', 'label': 'Categories','route':'editActivity','key': params.activityId,'activityId': params.activityId },
			{ 'icon':'', 'label': 'Specialties','route':'editActivity','key': params.activityId,'activityId': params.activityId },
			{ 'icon':'', 'label': 'Designer','route':'editActivity','key': params.activityId,'activityId': params.activityId }
		]
	},
	{ 'icon':'report', 'label': 'Reports','route':'editActivity','key': params.activityId,'activityId': params.activityId },
	{ 'icon':'clock-history', 'label': 'History','route':'editActivity','key': params.activityId,'activityId': params.activityId }
] />

<ul class="nav nav-list">
	<cfloop from="1" to="#arrayLen(tabs)#" index="i">
		<cfset tab = tabs[i] />
		
		<cfset tab['activeSubController'] = '' />
		<cfset tab['activeSubAction'] = '' />
		<cfset tab['subTabsHtml'] = '' />
		
		
<!---		<cfset tab_pagelet = lcase("#tab.controller#_#tab.action#") />
		<cfset tab_pagelet_token = lcase(left(HASH(tab_pagelet,'MD5'),6)) />
		--->
		<!--- build subnav --->
		<cfif structKeyExists(tab,'subnav') AND arrayLen(tab.subnav) GT 0>
			<cfset tab['subTabsHtml'] = '<ul class="subnav subnav-list">' />
			<cfloop from="1" to="#arrayLen(tab.subnav)#" index="e">
				<cfset subtab = tab.subnav[e] />
				<!---<cfset subtab_pagelet = lcase("#subtab.controller#_#subtab.action#") />
				<cfset subtab_pagelet_token = lcase(left(HASH(subtab_pagelet,'MD5'),6)) />--->

				<cfset tab.subTabsHtml &= '<li class="">' />
				
				<cfset tab.subTabsHtml &= '<a href="#urlFor(argumentCollection=subtab)#">#subtab.label# <span class="label counter">0</span></a>' />
				
				<cfset tab.subTabsHtml &= '</li>' />
			</cfloop>
			<cfset tab.subTabsHtml &= '</ul>' />
		</cfif>
	<li class="">
		<a href="#urlFor(argumentCollection=tab)#"><i class="icon16-#tab.icon#"></i> #tab.label#</a>
		#tab.subTabsHtml#
	</li>
	</cfloop>
</ul>
</cfoutput>