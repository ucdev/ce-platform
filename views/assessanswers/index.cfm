<h1>Listing assessanswers</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>
<p>#linkTo(text="New assessanswer", action="new")#</p>
</cfoutput>
<cfoutput>
<table class="table table-striped table-condensed">
	<thead>
		<th>Id</th>
		<th>Result ID</th>
		<th>Assessment ID</th>
		<th>Question ID</th>
		<th>I1</th>
		<th>I2</th>
		<th>V C1</th>
		<th>V C2</th>
		<th>D T1</th>
		<th>D T2</th>
		<th>TXT1</th>
		<th>TXT2</th>
		<th>Correct Flag</th>
		<th>Created</th>
		<th>Updated</th>
		<th>Updated By</th>
		<th>Deleted</th>
		<th>Deleted Flag</th>
		
	</thead>
	<tbody>
		<cfloop query="assessanswers">
		<tr>
			<td>#id#</td>
		<td>#ResultID#</td>
		<td>#AssessmentID#</td>
		<td>#QuestionID#</td>
		<td>#I1#</td>
		<td>#I2#</td>
		<td>#VC1#</td>
		<td>#VC2#</td>
		<td>#DT1#</td>
		<td>#DT2#</td>
		<td>#TXT1#</td>
		<td>#TXT2#</td>
		<td>#CorrectFlag#</td>
		<td>#Created#</td>
		<td>#Updated#</td>
		<td>#updatedBy#</td>
		<td>#Deleted#</td>
		<td>#DeletedFlag#</td>
		
		</tr>
		</cfloop>
	</tbody>
</table>
</cfoutput>

