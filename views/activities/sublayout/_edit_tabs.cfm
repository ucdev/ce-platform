
<cfoutput>
<cfset tabs = [
	{ 'icon':'card-address', 'label': 'Info', 'action':'edit' },
	{ 'icon':'card-address', 'label': 'Credits', 'action':'edit_credit' },
	{ 'icon':'card-address', 'label': 'Participants', 'action':'edit_faculty' },
	{ 'icon':'card-address', 'label': 'Faculty', 'action':'edit_participants' },
	{ 'icon':'card-address', 'label': 'Committee', 'action':'edit' },
	{ 'icon':'card-address', 'label': 'Finances', 'action':'edit' },
	{ 'icon':'card-address', 'label': 'Documents', 'action':'edit' },
	{ 'icon':'card-address', 'label': 'Other', 'action':'edit' },
	{ 'icon':'card-address', 'label': 'Publish', 'action':'edit' },
	{ 'icon':'card-address', 'label': 'Reports', 'action':'edit' },
	{ 'icon':'card-address', 'label': 'History', 'action':'edit' }
] />
<p>
<ul class="nav nav-list">
	<cfloop from="1" to="#arrayLen(tabs)#" index="i">
		<cfset tab = tabs[i] />
	<li<cfif params.action EQ tab.action> class="active"</cfif>><a href="#urlFor(action=tab.action,key=params.key)#"><i class="fugue-#tab.icon#"></i> #tab.label#</a></li>
	</cfloop>
</ul>
</p>
</cfoutput>