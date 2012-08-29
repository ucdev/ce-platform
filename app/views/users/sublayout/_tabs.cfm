<cfoutput>
<cfset tabs = [
	{ 'icon':'newspaper', 'label': 'News Feed', 'route':'root' },
	{ 'icon':'book-open', 'label': 'Activities', 'route':'activities' },
	{ 'icon':'mail', 'label': 'Messages', 'route':'messagesInbox' }
	
] />
<p>
<ul class="nav nav-list">
	<cfloop from="1" to="#arrayLen(tabs)#" index="i">
		<cfset tab = tabs[i] />
		
		<cfset tab['activeSubController'] = '' />
		<cfset tab['activeSubAction'] = '' />
		<cfset tab['subTabsHtml'] = '' />
		<li class="">
			<a href="#urlFor(argumentCollection=tab)#"><i class="icon16-#tab.icon#"></i> #tab.label#</a>
			#tab.subTabsHtml#
		</li>
	</cfloop>
</ul>
</p>
</cfoutput>