<h1>Listing cert_credits</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>
<p>#linkTo(text="New cert_credit", action="new")#</p>
</cfoutput>
<cfoutput>
<table class="table table-striped table-condensed">
	<thead>
		<th>Id</th>
		<th>Cert Id</th>
		<th>Credit Id</th>
		<th>Created</th>
		
	</thead>
	<tbody>
		<cfloop query="cert_credits">
		<tr>
			<td>#id#</td>
		<td>#certId#</td>
		<td>#creditId#</td>
		<td>#created#</td>
		
		</tr>
		</cfloop>
	</tbody>
</table>
</cfoutput>

