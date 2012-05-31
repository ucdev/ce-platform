<cfoutput>

	#errorMessagesFor("user")#

	#startFormTag(action="update", key=params.key)#
		
		<div class="group">
			#hiddenField(objectName='user', property='id')#
		</div>	
		
		<div>
			#textField(objectName='user', property='username', label='Username <em>*</em>')#
		</div>	

		<div>
			#textField(objectName='user', property='email', label='Email <em>*</em>')#
		</div>	
		
		<div>
			#submitTag()#
		</div>
		
	#endFormTag()#
	

#linkTo(text="Return to the listing", action="index")#
</cfoutput>
