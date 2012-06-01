<cfoutput>
<h1>Activities</h1>
<div>
	<h4>Find an activity</h4>
    #textFieldTag(name="title", value="", label="Title")#
    #textFieldTag(name="startDate", value="", label="Start Date")#
    #selectTag(name="activityTypeId", value="", label="Activity Type", options=activityTypes)#
    #selectTag(name="groupingId", value="", label="Grouping", options=activityGroupings, disabled=true)#
    #selectTag(name="categoryId", value="", label="Container", options=activityGroupings)#
</div>
</cfoutput>
<table class="table">
	<thead>
		<tr>
			<th>ID</th>
			<th></th>
			<th></th>
			<th></th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
	</tbody>
</table>

  <!---<cfoutput query="users">
  	<tr>
		<td>
			#users.id#
		</td>
		<td>
			#users.username#
		</td>
		<td>
			#users.email#
		</td>
		<td>
			#linkTo(text='Show', action='show', key=id)# | 
			#linkTo(text='Edit', action='Edit', key=id)# | 
			#linkTo(text='Delete', action='Delete', key=id, confirm='Are you sure?')#
		</td>            
	  </tr>
  </cfoutput>--->
