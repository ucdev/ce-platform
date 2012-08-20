<h1>Listing sys_apiclients</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>
<p>#linkTo(text="New sys_apiclient", action="new")#</p>
</cfoutput>
<cfoutput>
<table class="table table-striped table-condensed">
	<thead>
		<th>Id</th>
		<th>Name</th>
		<th>Contact Name</th>
		<th>Contact Phone</th>
		<th>Host Name</th>
		<th>Client Key</th>
		<th>Stat Users</th>
		<th>Stat Calls</th>
		<th>Stat Update</th>
		<th>Stat Signup</th>
		<th>Stat Login</th>
		<th>Last Accessed</th>
		<th>Created</th>
		<th>Updated</th>
		
	</thead>
	<tbody>
		<cfloop query="sys_apiclients">
		<tr>
			<td>#id#</td>
		<td>#name#</td>
		<td>#contactName#</td>
		<td>#contactPhone#</td>
		<td>#hostName#</td>
		<td>#clientKey#</td>
		<td>#statUsers#</td>
		<td>#statCalls#</td>
		<td>#statUpdate#</td>
		<td>#statSignup#</td>
		<td>#statLogin#</td>
		<td>#lastAccessed#</td>
		<td>#created#</td>
		<td>#updated#</td>
		
		</tr>
		</cfloop>
	</tbody>
</table>
</cfoutput>

