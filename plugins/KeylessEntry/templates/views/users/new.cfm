<h2>Sign up</h2>

<cfoutput>
	#errorMessagesFor("user")#

	#startFormTag(action="create")#
	
	  <p>
		  #textField(objectName='user', property='username')#
		</p>
		
		<p>
			#textField(objectName='user', property='firstName')#
		</p>
		
		<p>
			#textField(objectName='user', property='lastName')#
		</p>
					
		<p>
			#textField(objectName='user', property='email')#
		</p>
			
		<p>
		  #textField(objectName='user', property='password')#
		</p>
		
		<p>
			#textField(objectName='user', property='passwordConfirmation')#
		</p>

	#submitTag()#
		
	#endFormTag()#
</cfoutput>

