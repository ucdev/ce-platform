<cfoutput>
<h1>People</h1>
<div class="pull-left span7">
</div>
<div class="well pull-right span3">
    <h4>Find a person</h4>
	#startFormTag(name="frmSearch")#
        #textFieldTag(name="lastName", value="", label="", placeholder="Last Name")#
        #textFieldTag(name="firstName", value="", label="", placeholder="First Name")#
        #textFieldTag(name="ssn", value="", label="", placeholder="SSN")#
        #textFieldTag(name="birthdate", value="", label="", placeholder="Birthdate")#
        #textFieldTag(name="email", value="", label="", placeholder="Email")#
        #submitTag(value="Search", class="pull-right btn")#
    #endFormTag()#
</div>
</cfoutput>
<table class="table">
  <tr>
		<th>ID</th>
		<th></th>
		<th></th>
		<th></th>
  </tr>
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
</table>

