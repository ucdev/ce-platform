<cfoutput>
<h1>Activities</h1>
<div class="row">
	<div class="span18">
		<table class="table table-striped table-condensed">
			<thead>
				<tr>
					<th></th>
					<th>Information</th>
					<th>Start</th>
                    <th>End</th>
				</tr>
			</thead>
			<tbody>
				<cfloop query="activities">
				<tr>
					<td><img src="/images/icons/Status#activities.statusId#.png" /></td>
					<td>
						<a href="/activities/edit/#activities.id#">#activities.title#</a>
					</td>
					<td>#dateFormat(activities.startDate,'mm/dd/yyyy')#</td>
                    <td>#dateFormat(activities.endDate,'mm/dd/yyyy')#</td>
				</tr>
				</cfloop>
			</tbody>
		</table>
	</div>
	<div class="span6">
		#startFormTag(name="frmSearch",class=" well well-small",style="margin-top:10px;")#
			<h3>Find an activity</h3>
			#textFieldTag(name="title", value="", append="", prepend="", label="", class="span5", placeholder="Title")#
			#textFieldTag(name="startDate", value="", append="", prepend="", label="", class="span5", placeholder="Start Date")#
			#selectTag(name="activityTypeId", value="", append="", prepend="", class="span5", label="Activity Type", options=activityTypes)#
			#selectTag(name="groupingId", value="", append="", prepend="", label="Grouping", class="span5", options=activityGroupings, disabled=true)#
			#selectTag(name="categoryId", value="", append="", prepend="", label="Container", class="span5", options=activityCategories)#
			
			#submitTag(value="Search", class="btn btn-primary")#
		#endFormTag()#
	</div>
</div>
</cfoutput>
