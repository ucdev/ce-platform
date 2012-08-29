<h1>Listing person_emails</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>
<p>#linkTo(text="New person_email", action="new")#</p>
</cfoutput>
<cfoutput>
<table class="table table-striped table-condensed">
	<thead>
		<th>Id</th>
		<th>Person_id</th>
		<th>Email_address</th>
		<th>Is_verified</th>
		<th>Verification_key</th>
		<th>Allow_login</th>
		
	</thead>
	<tbody>
		<cfloop query="person_emails">
		<tr>
			<td>#id#</td>
		<td>#person_id#</td>
		<td>#email_address#</td>
		<td>#is_verified#</td>
		<td>#verification_key#</td>
		<td>#allow_login#</td>
		
		</tr>
		</cfloop>
	</tbody>
</table>
</cfoutput>

