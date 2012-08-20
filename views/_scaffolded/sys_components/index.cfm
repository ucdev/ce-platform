<h1>Listing sys_components</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>
<p>#linkTo(text="New sys_component", action="new")#</p>
</cfoutput>
<cfoutput>
<table class="table table-striped table-condensed">
	<thead>
		<th>Id</th>
		<th>Name</th>
		<th>Description</th>
		<th>Type Code</th>
		<th>Sort Flag</th>
		<th>Max Usage</th>
		
	</thead>
	<tbody>
		<cfloop query="sys_components">
		<tr>
			<td>#id#</td>
		<td>#Name#</td>
		<td>#Description#</td>
		<td>#TypeCode#</td>
		<td>#SortFlag#</td>
		<td>#MaxUsage#</td>
		
		</tr>
		</cfloop>
	</tbody>
</table>
</cfoutput>

