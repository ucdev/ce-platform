<h1>Listing activity_faculties</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>
<p>#linkTo(text="New activity_faculty", action="new")#</p>
</cfoutput>
<cfoutput>
<table class="table table-striped table-condensed">
	<thead>
		<th>Id</th>
		<th>Activity ID</th>
		<th>Person ID</th>
		<th>CVFile ID</th>
		<th>CVApprove Flag</th>
		<th>Disclosure File ID</th>
		<th>Disclosure Approve Flag</th>
		<th>Role ID</th>
		<th>Created</th>
		<th>Created By</th>
		<th>Updated</th>
		<th>Updated By</th>
		<th>Deleted</th>
		<th>Deleted Flag</th>
		
	</thead>
	<tbody>
		<cfloop query="activity_faculties">
		<tr>
			<td>#id#</td>
		<td>#ActivityID#</td>
		<td>#PersonID#</td>
		<td>#CVFileID#</td>
		<td>#CVApproveFlag#</td>
		<td>#DisclosureFileID#</td>
		<td>#DisclosureApproveFlag#</td>
		<td>#RoleID#</td>
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

