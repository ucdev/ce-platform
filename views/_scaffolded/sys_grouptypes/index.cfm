<h1>Listing sys_grouptypes</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>
<p>#linkTo(text="New sys_grouptype", action="new")#</p>
</cfoutput>
<cfoutput>
<table class="table table-striped table-condensed">
	<thead>
		<th>Id</th>
		<th>Title</th>
		<th>Details</th>
		
	</thead>
	<tbody>
		<cfloop query="sys_grouptypes">
		<tr>
			<td>#id#</td>
		<td>#title#</td>
		<td>#details#</td>
		
		</tr>
		</cfloop>
	</tbody>
</table>
</cfoutput>

