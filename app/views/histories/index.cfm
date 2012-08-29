<h1>Listing histories</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>
<p>#linkTo(text="New history", action="new")#</p>
</cfoutput>
<cfoutput>
<table class="table table-striped table-condensed">
	<thead>
		<th>Id</th>
		<th>History Style ID</th>
		<th>History HTML</th>
		<th>From Person ID</th>
		<th>From Activity ID</th>
		<th>To Person ID</th>
		<th>To Activity ID</th>
		<th>To History ID</th>
		<th>To Container ID</th>
		<th>To Content</th>
		<th>To Credit ID</th>
		<th>To Site ID</th>
		<th>Old Action ID</th>
		<th>Created</th>
		<th>Hidden Flag</th>
		
	</thead>
	<tbody>
		<cfloop query="histories">
		<tr>
			<td>#id#</td>
		<td>#HistoryStyleID#</td>
		<td>#HistoryHTML#</td>
		<td>#FromPersonID#</td>
		<td>#FromActivityID#</td>
		<td>#ToPersonID#</td>
		<td>#ToActivityID#</td>
		<td>#ToHistoryID#</td>
		<td>#ToContainerID#</td>
		<td>#ToContent#</td>
		<td>#ToCreditID#</td>
		<td>#ToSiteID#</td>
		<td>#OldActionID#</td>
		<td>#Created#</td>
		<td>#HiddenFlag#</td>
		
		</tr>
		</cfloop>
	</tbody>
</table>
</cfoutput>

