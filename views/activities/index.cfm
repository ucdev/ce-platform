<cfoutput>
<h1>Activities</h1>
<div class="pull-left span8">
    <table class="table-striped span8">
        <tbody>
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
<div class="well pull-right span3">
    <h4>Find an activity</h4>
	#startFormTag(name="frmSearch")#
        #textFieldTag(name="title", value="", label="", placeholder="Title")#
        #textFieldTag(name="startDate", value="", label="", placeholder="Start Date")#
        #selectTag(name="activityTypeId", value="", label="Activity Type", options=activityTypes)#
        #selectTag(name="groupingId", value="", label="Grouping", options=activityGroupings, disabled=true)#
        #selectTag(name="categoryId", value="", label="Container", options=activityCategories)#
        #submitTag(value="Search", class="pull-right btn")#
    #endFormTag()#
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
