<cfoutput>
<cfset tabs = [
	{ 'icon':'card-address', 'label': 'Info', 'action':'edit' },
	{ 'icon':'trophy', 'label': 'Credits', 'action':'edit_credit' },
	{ 'icon':'users', 'label': 'Participants', 'action':'edit_participants' },
	{ 'icon':'user-business', 'label': 'Faculty', 'action':'edit_faculty' },
	{ 'icon':'user-female', 'label': 'Committee', 'action':'edit_committee' },
	{ 'icon':'chart-up-color', 'label': 'Finances', 'action':'edit_finances' },
	{ 'icon':'inbox-document', 'label': 'Documents', 'action':'edit_documents' },
	{ 'icon':'sticky-note-pin', 'label': 'Notes', 'action':'edit_notes' },
	{ 'icon':'calendar', 'label': 'Schedule', 'action':'edit_agenda' },
	{ 'icon':'envelope', 'label': 'Application', 'action':'edit_app' },
	{ 'icon':'bug', 'label': 'CDC', 'action':'edit_cdc' },
	{ 'icon':'accme', 'label': 'ACCME', 'action':'edit_accme' },
	{ 'icon':'globe-green', 'label': 'Publish', 'action':'edit_publish' },
	{ 'icon':'report', 'label': 'Reports', 'action':'edit_reports' },
	{ 'icon':'clock-history', 'label': 'History', 'action':'edit_history' }
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