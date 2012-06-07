<cfoutput>
#startFormTag(name="frmSearch",class="search-box form-inline well well-small",style="margin-top:10px;")#
	#textFieldTag(name="q", value="", append="", prepend="", label="", class="span5", placeholder="Keyword Search")#
	<span class="advanced hide">
	#textFieldTag(name="startDate", value="", append="", prepend="", label="", class="span5", placeholder="Start Date")#
	#selectTag(name="activityTypeId", value="", append="", prepend="", class="span5", label="Activity Type", options=activityTypes)#
	#selectTag(name="groupingId", value="", append="", prepend="", label="Grouping", class="span5", options=activityGroupings, disabled=true)#
	#selectTag(name="categoryId", value="", append="", prepend="", label="Container", class="span5", options=activityCategories)#
	</span>
	#submitTag(value="Search", class="btn btn-primary")#
#endFormTag()#
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
			<td><img src="/images/no-photo/activity_i.png" /></td>
			<td>
				<a href="/activities/adm_general/#activities.id#">#activities.title#</a>
			</td>
			<td>#dateFormat(activities.startDate,'mm/dd/yyyy')#</td>
			<td>#dateFormat(activities.endDate,'mm/dd/yyyy')#</td>
		</tr>
		</cfloop>
	</tbody>
</table>
</cfoutput>
