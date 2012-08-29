<h1>Listing assessquestions</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>
<p>#linkTo(text="New assessquestion", action="new")#</p>
</cfoutput>
<cfoutput>
<table class="table table-striped table-condensed">
	<thead>
		<th>Id</th>
		<th>Question Type ID</th>
		<th>Assessment ID</th>
		<th>Label Text</th>
		<th>Detail Text</th>
		<th>Required Flag</th>
		<th>Correct Field</th>
		<th>Section ID</th>
		<th>Sort</th>
		<th>I1</th>
		<th>I2</th>
		<th>I3</th>
		<th>I4</th>
		<th>I5</th>
		<th>I6</th>
		<th>I7</th>
		<th>I8</th>
		<th>I9</th>
		<th>I10</th>
		<th>Vc1</th>
		<th>Vc2</th>
		<th>Vc3</th>
		<th>Vc4</th>
		<th>Vc5</th>
		<th>Vc6</th>
		<th>Vc7</th>
		<th>Vc8</th>
		<th>Vc9</th>
		<th>Vc10</th>
		<th>Dt1</th>
		<th>Dt2</th>
		<th>Dt3</th>
		<th>Dt4</th>
		<th>Dt5</th>
		<th>Txt1</th>
		<th>Txt2</th>
		<th>Txt3</th>
		<th>Txt4</th>
		<th>Txt5</th>
		<th>External ID</th>
		<th>Created</th>
		<th>Updated</th>
		<th>Deleted</th>
		<th>Deleted By</th>
		<th>Deleted Flag</th>
		
	</thead>
	<tbody>
		<cfloop query="assessquestions">
		<tr>
			<td>#id#</td>
		<td>#QuestionTypeID#</td>
		<td>#AssessmentID#</td>
		<td>#LabelText#</td>
		<td>#DetailText#</td>
		<td>#RequiredFlag#</td>
		<td>#CorrectField#</td>
		<td>#SectionID#</td>
		<td>#Sort#</td>
		<td>#i1#</td>
		<td>#i2#</td>
		<td>#i3#</td>
		<td>#i4#</td>
		<td>#i5#</td>
		<td>#i6#</td>
		<td>#i7#</td>
		<td>#i8#</td>
		<td>#i9#</td>
		<td>#i10#</td>
		<td>#vc1#</td>
		<td>#vc2#</td>
		<td>#vc3#</td>
		<td>#vc4#</td>
		<td>#vc5#</td>
		<td>#vc6#</td>
		<td>#vc7#</td>
		<td>#vc8#</td>
		<td>#vc9#</td>
		<td>#vc10#</td>
		<td>#dt1#</td>
		<td>#dt2#</td>
		<td>#dt3#</td>
		<td>#dt4#</td>
		<td>#dt5#</td>
		<td>#txt1#</td>
		<td>#txt2#</td>
		<td>#txt3#</td>
		<td>#txt4#</td>
		<td>#txt5#</td>
		<td>#ExternalID#</td>
		<td>#Created#</td>
		<td>#Updated#</td>
		<td>#Deleted#</td>
		<td>#DeletedBy#</td>
		<td>#DeletedFlag#</td>
		
		</tr>
		</cfloop>
	</tbody>
</table>
</cfoutput>

