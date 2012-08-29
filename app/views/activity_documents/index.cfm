<h1>Listing documents</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>
<p>#linkTo(text="New activity_document", action="new")#</p>
</cfoutput>
<cfoutput>
<table class="table table-striped table-condensed">
	<thead>
		<th>Id</th>
		<th>Activity ID</th>
		
	</thead>
	<tbody>
		<cfloop query="files">
		<tr>
		<td>#id#</td>
		<td>#ActivityID#</td>
		</tr>
		</cfloop>
	</tbody>
</table>
</cfoutput>

