<h1>Listing imagetypes</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>
<p>#linkTo(text="New imagetype", action="new")#</p>
</cfoutput>
<cfoutput>
<table class="table table-striped table-condensed">
	<thead>
		<th>Id</th>
		<th>Name</th>
		
	</thead>
	<tbody>
		<cfloop query="imagetypes">
		<tr>
			<td>#id#</td>
		<td>#name#</td>
		
		</tr>
		</cfloop>
	</tbody>
</table>
</cfoutput>

