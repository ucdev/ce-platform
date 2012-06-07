<h1>Listing person_users</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>
<p>#linkTo(text="New person_user", action="new")#</p>
</cfoutput>
<cfoutput>
<table class="table table-striped table-condensed">
	<thead>
		<th>Id</th>
		<th>Displayname</th>
		<th>Primary_email_id</th>
		<th>Primary_image_id</th>
		<th>Primary_entity_id</th>
		<th>Password</th>
		<th>Last_login</th>
		<th>Last_login_ip</th>
		
	</thead>
	<tbody>
		<cfloop query="person_users">
		<tr>
			<td>#id#</td>
		<td>#displayname#</td>
		<td>#primary_email_id#</td>
		<td>#primary_image_id#</td>
		<td>#primary_entity_id#</td>
		<td>#password#</td>
		<td>#last_login#</td>
		<td>#last_login_ip#</td>
		
		</tr>
		</cfloop>
	</tbody>
</table>
</cfoutput>

