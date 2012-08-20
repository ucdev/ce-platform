<h1>Listing sys_emailstyles</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>
<p>#linkTo(text="New sys_emailstyle", action="new")#</p>
</cfoutput>
<cfoutput>
<table class="table table-striped table-condensed">
	<thead>
		<th>Id</th>
		<th>Subject</th>
		<th>Template HTML</th>
		<th>Template Plain</th>
		
	</thead>
	<tbody>
		<cfloop query="sys_emailstyles">
		<tr>
			<td>#id#</td>
		<td>#Subject#</td>
		<td>#TemplateHTML#</td>
		<td>#TemplatePlain#</td>
		
		</tr>
		</cfloop>
	</tbody>
</table>
</cfoutput>

