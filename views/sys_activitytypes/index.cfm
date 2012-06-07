<h1>Listing sys_activitytypes</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>
<p>#linkTo(text="New sys_activitytype", action="new")#</p>
</cfoutput>
<cfoutput>
<table class="table table-striped table-condensed">
	<thead>
		<th>Id</th>
		<th>Name</th>
		<th>Display Name</th>
		<th>Description</th>
		<th>Code</th>
		<th>Created</th>
		<th>Updated</th>
		<th>Deleted</th>
		<th>Deleted Flag</th>
		
	</thead>
	<tbody>
		<cfloop query="sys_activitytypes">
		<tr>
			<td>#id#</td>
		<td>#Name#</td>
		<td>#DisplayName#</td>
		<td>#Description#</td>
		<td>#Code#</td>
		<td>#Created#</td>
		<td>#Updated#</td>
		<td>#Deleted#</td>
		<td>#DeletedFlag#</td>
		
		</tr>
		</cfloop>
	</tbody>
</table>
</cfoutput>

