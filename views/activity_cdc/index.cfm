<h1>Listing activity_cdcs</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>
<p>#linkTo(text="New activity_cdc", action="new")#</p>
</cfoutput>
<cfoutput>
<table class="table table-striped table-condensed">
	<thead>
		<th>Other ID</th>
		<th>Activity ID</th>
		<th>Didactic Hrs</th>
		<th>Experimental Hrs</th>
		<th>Sec Clin Site Flag</th>
		<th>Collab PTC Flag</th>
		<th>Collab PTC Specify</th>
		<th>Collab Agency Flag</th>
		<th>Collab Agency Specify</th>
	</thead>
	<tbody>
		<cfloop query="activity_cdcs">
		<tr>
		<td>#OtherID#</td>
		<td>#ActivityID#</td>
		<td>#DidacticHrs#</td>
		<td>#ExperimentalHrs#</td>
		<td>#SecClinSiteFlag#</td>
		<td>#CollabPTCFlag#</td>
		<td>#CollabPTCSpecify#</td>
		<td>#CollabAgencyFlag#</td>
		<td>#CollabAgencySpecify#</td>
		
		</tr>
		</cfloop>
	</tbody>
</table>
</cfoutput>

