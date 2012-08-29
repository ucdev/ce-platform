<h2>Sign up</h2>

<cfoutput>
	#errorMessagesFor("person")#

	#startFormTag(action="create")#
	
		
		<p>
			#textField(objectName='person', property='firstName')#
		</p>
		
		<p>
			#textField(objectName='person', property='lastName')#
		</p>
					
		<p>
			#textField(objectName='person', property='email')#
		</p>
			
		<p>
		  #textField(objectName='person', property='password')#
		</p>
		
		<p>
			#textField(objectName='person', property='passwordConfirmation')#
		</p>

	#submitTag()#
		
	#endFormTag()#
</cfoutput>


