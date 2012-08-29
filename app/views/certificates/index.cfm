<h1>Listing certificates</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>
<p>#linkTo(text="New certificate", action="new")#</p>
</cfoutput>
<cfoutput>
<table class="table table-striped table-condensed">
	<thead>
		<th>Id</th>
		<th>Title</th>
		<th>Detail</th>
		<th>Cert Config File</th>
		
	</thead>
	<tbody>
		<cfloop query="certificates">
		<tr>
			<td>#id#</td>
		<td>#title#</td>
		<td>#detail#</td>
		<td>#certConfigFile#</td>
		
		</tr>
		</cfloop>
	</tbody>
</table>
</cfoutput>

