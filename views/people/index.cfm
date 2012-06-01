<cfoutput>
<h1>People</h1>
<div class="pull-left span8">
    <table class="table-striped span8">
        <tbody>
            <tr>
                <td valign="top"><i class="icon-fire"></i></td>
                <td>
                	<h4><a href="/people/slamkajs">Slamka, Justin <span class="label">(Big Pimpin')</span></a></h4>
                    <div>
                    	<strong>Email</strong>: <a href="mailto:jslamka5685@gmail.com">jslamka5685@gmail.com</a>
                    </div>
                </td>
            </tr>
            <tr>
                <td valign="top"><i class="icon-fire"></i></td>
                <td>
                	<h4><a href="/people/slamkajs">Slamka, Justin <span class="label">(Big Pimpin')</span></a></h4>
                    <div>
                    	<strong>Email</strong>: <a href="mailto:jslamka5685@gmail.com">jslamka5685@gmail.com</a>
                    </div>
                </td>
            </tr>
        </tbody>
    </table>
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

