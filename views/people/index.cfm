<cfoutput>
<h1>People</h1>
<div class="row">
	<div class="span18">
		<table class="table table-striped table-condensed">
			<thead>
				<tr>
					<th></th>
					<th>Information</th>
					<th>Primary Email</th>
                    <th>SSN</th>
                    <th>Birthdate</th>
				</tr>
			</thead>
			<tbody>
				<cfloop query="people">
				<tr>
					<td valign="top"><i class="icon-fire"></i></td>
					<td>
						<a href="/people/edit/#people.id#">#people.firstName# #people.lastName#</a>
					</td>
					<td>#people.email#</td>
					<td>#people.ssn#</td>
                    <td>#dateFormat(people.birthDate,'mm/dd/yyyy')#</td>
				</tr>
				</cfloop>
			</tbody>
        </table>
    </div>
	<div class="span6">
		#startFormTag(name="frmSearch",class=" well well-small",style="margin-top:10px;")#
        <h4>Find a person</h4>
            #textFieldTag(name="lastName", value="", label="", placeholder="Last Name", class="span5")#
            #textFieldTag(name="firstName", value="", label="", placeholder="First Name", class="span5")#
            #textFieldTag(name="ssn", value="", label="", placeholder="SSN", class="span5")#
            #textFieldTag(name="birthdate", value="", label="", placeholder="Birthdate", class="span5")#
            #textFieldTag(name="email", value="", label="", placeholder="Email", class="span5")#
            
			#submitTag(value="Search", class="btn btn-primary")#
        #endFormTag()#
    </div>
</div>
</cfoutput>
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

