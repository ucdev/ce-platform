<h1>Listing person_addresses</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>
<p>#linkTo(text="New person_address", action="new")#</p>
</cfoutput>
<cfoutput>
<table class="table table-striped table-condensed">
	<thead>
		<th>Id</th>
		<th>Person ID</th>
		<th>Address Type ID</th>
		<th>Address1</th>
		<th>Address2</th>
		<th>City</th>
		<th>State</th>
		<th>State Id</th>
		<th>Province</th>
		<th>Country</th>
		<th>Country Id</th>
		<th>Zip Code</th>
		<th>Phone1</th>
		<th>Phone1 Ext</th>
		<th>Phone2</th>
		<th>Phone2 Ext</th>
		<th>Phone3</th>
		<th>Phone3 Ext</th>
		<th>Geonameid</th>
		<th>Created</th>
		<th>Created By</th>
		<th>Updated</th>
		<th>Updated By</th>
		
	</thead>
	<tbody>
		<cfloop query="person_addresses">
		<tr>
			<td>#id#</td>
		<td>#PersonID#</td>
		<td>#AddressTypeID#</td>
		<td>#Address1#</td>
		<td>#Address2#</td>
		<td>#City#</td>
		<td>#State#</td>
		<td>#stateId#</td>
		<td>#Province#</td>
		<td>#Country#</td>
		<td>#countryId#</td>
		<td>#ZipCode#</td>
		<td>#Phone1#</td>
		<td>#Phone1Ext#</td>
		<td>#Phone2#</td>
		<td>#Phone2Ext#</td>
		<td>#Phone3#</td>
		<td>#Phone3Ext#</td>
		<td>#geonameid#</td>
		<td>#Created#</td>
		<td>#CreatedBy#</td>
		<td>#Updated#</td>
		<td>#UpdatedBy#</td>
		
		</tr>
		</cfloop>
	</tbody>
</table>
</cfoutput>

