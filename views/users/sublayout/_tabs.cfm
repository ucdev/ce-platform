<cfoutput>
<cfset tabs = [
	{ 'icon':'newspaper', 'label': 'News Feed', 'controller':'users', 'action':'home' },
	{ 'icon':'book-open', 'label': 'Activities', 'controller':'activities','action':'index' },
	{ 'icon':'mail', 'label': 'Messages', 'controller':'messages','action':'inbox' }
	
] />
<p>
<ul class="nav nav-list">
	<cfloop from="1" to="#arrayLen(tabs)#" index="i">
		<cfset tab = tabs[i] />
	<li<cfif params.action EQ tab.action> class="active"</cfif>><a href="#urlFor(controller=tab.controller,action=tab.action)#"><i class="icon16-#tab.icon#"></i> #tab.label#</a></li>
	</cfloop>
</ul>
</p>
</cfoutput>