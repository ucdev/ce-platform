<cfoutput>
<h1>Activities</h1>
<div class="row">
	<div class="span18">
		<table class="table table-striped table-bordered table-condensed">
			<thead>
				<tr>
					<th></th>
					<th>Information</th>
					<th>Status</th>
					<th>Start / End</th>
					<th>Created</th>
					<th>Updated</th>
				</tr>
			</thead>
			<tbody>
				<cfloop query="activities">
				<tr>
					<td valign="top"><i class="icon-thumbs-up"></i></td>
					<td>
						<a href="/activities/13660">#activities.title#</a>
					</td>
					<td>#activities.statusId#</td>
					<td>#dateFormat(activities.startDate,'mm/dd/yyyy')# #dateFormat(activities.endDate,'mm/dd/yyyy')#</td>
					<td>#dateFormat(activities.created,'mm/dd/yyyy')#</td>
					<td>#dateFormat(activities.updated,'mm/dd/yyyy')#</td>
				</tr>
				</cfloop>
				<tr>
					<td valign="top"><i class="icon-thumbs-up"></i></td>
					<td>
						<a href="/activities/13660">Truth About Diagnostic Tests</a>
						<i class="icon-book"></i>
						<div>Created on 09/22/2009 by William Fant</div>
						<div>Updated on 09/22/2009 by System Admin</div>
						<div>
							<h5>Start Date: 5/12/2020 | Activity Type: Enduring Material | Grouping: Internet Activity Enduring Material</h5>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="span6">
		<h3>Find an activity</h3>
		#startFormTag(name="frmSearch",class=" well well-small",style="margin-top:10px;")#
			#textFieldTag(name="title", value="",append="",prepend="",label="",class="span5", placeholder="Title")#
			#textFieldTag(name="startDate", value="",append="",prepend="", label="",class="span5", placeholder="Start Date")#
			#selectTag(name="activityTypeId", value="",append="",prepend="",class="span5", label="Activity Type", options=activityTypes)#
			#selectTag(name="groupingId", value="",append="",prepend="", label="Grouping",class="span5", options=activityGroupings, disabled=true)#
			#selectTag(name="categoryId", value="",append="",prepend="", label="Container",class="span5", options=activityCategories)#
			
			#submitTag(value="Search", class="btn btn-primary")#
		#endFormTag()#
	</div>
</div>
</cfoutput>
