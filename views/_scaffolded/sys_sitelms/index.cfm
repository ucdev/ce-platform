<h1>Listing sys_sitelms</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>
<p>#linkTo(text="New sys_sitelms", action="new")#</p>
</cfoutput>
<cfoutput>
<table class="table table-striped table-condensed">
	<thead>
		<th>Id</th>
		<th>Name</th>
		<th>Name Short</th>
		<th>Description</th>
		<th>Domain Name</th>
		<th>Contact Name</th>
		<th>Contact Phone</th>
		<th>Created</th>
		<th>Created By</th>
		<th>Updated</th>
		<th>Updated By</th>
		<th>Deleted</th>
		<th>Deleted Flag</th>
		
	</thead>
	<tbody>
		<cfloop query="sys_sitelms">
		<tr>
			<td>#id#</td>
		<td>#Name#</td>
		<td>#NameShort#</td>
		<td>#Description#</td>
		<td>#DomainName#</td>
		<td>#ContactName#</td>
		<td>#ContactPhone#</td>
		<td>#Created#</td>
		<td>#CreatedBy#</td>
		<td>#Updated#</td>
		<td>#UpdatedBy#</td>
		<td>#Deleted#</td>
		<td>#DeletedFlag#</td>
		
		</tr>
		</cfloop>
	</tbody>
</table>
</cfoutput>

