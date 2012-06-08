<h1>Listing activity_accmes</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>
<p>#linkTo(text="New activity_accme", action="new")#</p>
</cfoutput>
<cfoutput>
<table class="table table-striped table-condensed">
	<thead>
		<th>Other ID</th>
		<th>Activity ID</th>
		<th>Competence Design</th>
		<th>Performance Design</th>
		<th>Outcomes Design</th>
		<th>Competence Eval</th>
		<th>Performance Eval</th>
		<th>Outcomes Eval</th>
	</thead>
	<tbody>
		<cfloop query="activity_accmes">
		<tr>
			<td>#OtherID#</td>
		<td>#ActivityID#</td>
		<td>#competenceDesign#</td>
		<td>#performanceDesign#</td>
		<td>#outcomesDesign#</td>
		<td>#competenceEval#</td>
		<td>#performanceEval#</td>
		<td>#outcomesEval#</td>
		
		</tr>
		</cfloop>
	</tbody>
</table>
</cfoutput>

