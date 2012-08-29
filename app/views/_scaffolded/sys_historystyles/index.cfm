<h1>Listing sys_historystyles</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>
<p>#linkTo(text="New sys_historystyle", action="new")#</p>
</cfoutput>
<cfoutput>
<table class="table table-striped table-condensed">
	<thead>
		<th>Id</th>
		<th>History Type ID</th>
		<th>Title</th>
		<th>Template From</th>
		<th>Template To</th>
		<th>Possessive Flag</th>
		<th>Icon Img</th>
		<th>Old Titles</th>
		
	</thead>
	<tbody>
		<cfloop query="sys_historystyles">
		<tr>
			<td>#id#</td>
		<td>#HistoryTypeID#</td>
		<td>#Title#</td>
		<td>#TemplateFrom#</td>
		<td>#TemplateTo#</td>
		<td>#PossessiveFlag#</td>
		<td>#IconImg#</td>
		<td>#OldTitles#</td>
		
		</tr>
		</cfloop>
	</tbody>
</table>
</cfoutput>

